;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a3q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 3, Question 3                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the number of keys between two keys on a   ;;
;; piano)                                                 ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;

;; Question 3:

;; A bar is a (listof note) [Non-Empty]

;; A key of note can be represented as a pair of integers (a,b) where:

;; a is the number of the octave between [0..8]
;; b is the sequence number within an octave between [1..12]


;; largest-range: (listof bar) -> (listof bar nat)
;; Consumes a list of bars of notes, bars, and produces the bar with
;; the highest range between individual notes and the number of keys
;; between the highest range.
;; Examples:
;;  (largest-range '(((0 1) (0 2))
;;                  ((0 1) (1 1))
;;                  (( 0 1) ( 2 3) (8 12)) 
;;                  ((4 1)(4 10 )(5 2))
;;                  ((3 5) (4 8) (2 5) (1 12))
;;                  ((1 2) (3 4) (1 12))))
;;  => '((( 0 1) ( 2 3) (8 12)) 88)
;;(largest-range '(((3 7) (3 4) (4 1) (3 8))
;;                  ((4 5) (4 11) (5 4))
;;                  ((5 5) (5 3)	(5 11) (5 11) (6 2))))
;; => '(((4 5) (4 11) (5 4)) 12)
;;  (largest-range '(((0 1) (0 1))
;;                  ((1 1) (1 1))))
;; => '((( 0 1) (0 1)) 1)
;;(largest-range '(((0 1) (0 2))
;;                  ((1 1) (1 2))))
;; => '((( 0 1) (0 2)) 2)

(define (largest-range bars)
  (local
    [;; highest-note: bar note-> note
     ;; Consumes a bar of notes, notes, and a note , high-note, and 
     ;; produces the highest octave note in the bar.
     (define (highest-note notes high-note)
       (local
         [(define high-octave 
            (filter (lambda (note) 
                      (equal? (first note)
                              (foldr max 0 (map first notes))))
                    notes))]
         (cond
           [(empty? high-octave) high-note]
           [(= (second high-note)
               (second (first high-octave)))
            (highest-note (rest high-octave) high-note)]
           [(> (second high-note)
               (second (first high-octave)))
            (highest-note (rest high-octave) high-note)]
           [(> (second (first high-octave))
               (second high-note))
            (highest-note (rest high-octave) (first high-octave))])))
     ;; lowest-note: bar note-> note
     ;; Consumes a bar of notes, notes, and a note , min-note, and 
     ;; produces the lowest octave note in the bar.     
     (define (lowest-note notes min-note)
       (local
         [(define min-octave 
            (filter (lambda (note) 
                      (equal? (first note)
                              (foldr min 9 (map first notes))))
                    notes))]
         (cond
           [(empty? min-octave) min-note]
           [(= (second min-note)
               (second (first min-octave)))
            (lowest-note (rest min-octave) min-note)]
           [(< (second min-note)
               (second (first min-octave)))
            (lowest-note (rest min-octave) min-note)]
           [(< (second (first min-octave))
               (second min-note))
            (lowest-note (rest min-octave) (first min-octave))])))    
     ;; range: note note -> nat
     ;; Consumes two notes, note1, note2 and produces the number
     ;; of keys between the two notes, that is, the range.
     (define (range note1 note2)
       (cond
         [(= (first note1) (first  note2))
          (add1 (- (max (second note1) (second note2))
                   (min (second note1) (second note2))))]
         [(= 1 (- (first note1) (first note2)))
          (+ 1 (second note1)
             (- 12 (second note2)))]
         [(> (- (first note1) (first note2)) 1)
          (+ 1 (* 8 (- (first note1) (first note2)))
             (second note1) 
             (- 12 (second note2)))]))     
     ;; top-range?: nat bar -> nat
     ;; Consumes a bar and produces the largest range between
     ;; notes in the bar.
     (define (top-range? top-range bar)
       (range (highest-note bar (list 0 0))
              (lowest-note bar (list 9 13))))     
     ;; top-ranged: bar (listof bar)-> bar
     ;; Consumes a bar, top bar, and a list of bars and produces
     ;; the bar with the highest range.
     (define (top-ranged top-so-far lob)
       (cond
         [(empty? (rest lob)) top-so-far]
         [(= (top-range? 0 (first lob))
             (top-range? 0 top-so-far))
          (top-ranged top-so-far (rest lob))]
         [(> (top-range? 0 (first lob))
             (top-range? 0 top-so-far))
          (top-ranged (first lob) (rest lob))]
         [else 
          (top-ranged top-so-far (rest lob))]))]    
    (list (top-ranged (first bars) bars)
          (top-range? 0 (top-ranged (first bars) bars)))))
;;Tests:
(check-expect 
 (largest-range '(((2 7) (3 4) (4 1) (5 8))
                  ((4 5) (4 11) (5 4))
                  ((5 5) (5 3)	(5 11) (5 11) (6 2))))
 '(((2 7) (3 4) (4 1) (5 8)) 38))
(check-expect 
 (largest-range '(((3 7) (3 4) (4 1) (3 8))
                  ((4 5) (4 11) (5 4))
                  ((5 5) (5 3)	(5 11) (5 11) (6 2))))
 '(((4 5) (4 11) (5 4)) 12))
(check-expect
 (largest-range '((( 0 10) ( 2 3) (1 1))
                  ((2 3) (4 4))
                  ((4 1)(4 10 )(5 2))
                  ((3 5) (4 8) (2 5) (1 12))
                  ((1 2) (3 4) (1 12))))
 '(((3 5) (4 8) (2 5) (1 12)) 33))
(check-expect
 (largest-range '(((0 1) (0 1))
                  ((1 1) (1 1))))
 '((( 0 1) (0 1)) 1))
(check-expect
 (largest-range '(((0 1) (0 2))
                  ((1 1) (1 2))))
 '((( 0 1) (0 2)) 2))
(check-expect
 (largest-range '(((0 1) (0 2))
                  ((0 1) (1 1))
                  (( 0 1) ( 2 3) (8 12)) 
                  ((4 1)(4 10 )(5 2))
                  ((3 5) (4 8) (2 5) (1 12))
                  ((1 2) (3 4) (1 12))))
 '((( 0 1) ( 2 3) (8 12)) 88))

