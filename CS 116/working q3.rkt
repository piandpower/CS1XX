;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |working q3|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;(define (range note1 note2)
;  (cond
;    [(= (first note1) (first  note2))
;     (add1 (- (max (second note1) (second note2))
;              (min (second note1) (second note2))))]
;    [(= 1 (- (first note1) (first note2)))
;     (+ 1 (second note1)
;        (- 12 (second note2)))]
;    [(= 1 (- (first note2) (first note1)))
;     (+ 1 (second note2)
;        (- 12 (second note1)))]
;    [(> 1 (- (first note1) (first note2)))
;     (+ 1 (* 8 (- (first note1) (first note2)))
;        (second note1) 
;        (- 12 (second note2)))]
;    [(> 1 (- (first note2) (first note1)))
;     (+ 1 (* 8 (- (first note2) (first note1)))
;        (second note2) 
;        (- 12 (second note1)))]))
;
;(range '(4 5) '(5 4))
;
;(define (top-range? top-range bar)
;  (cond
;    [(empty? (rest bar)) top-range]
;    [else (top-range? (max top-range
;                           (range (first bar) (second bar)))
;                      (rest bar))]))
;
;(top-range? 0 '((4 5) (4 11) (5 4)))

;(define (high-octave notes) (filter (lambda (note) (equal? (first note)
;                                                      (foldr max 0 (map first notes))))
;                               notes))
;
;(define (highest-note notes high-note)
;  (local
;    [(define high-octave (filter (lambda (note) (equal? (first note)
;                                                      (foldr max 0 (map first notes))))
;                               notes))]
;  (cond
;    [(empty? high-octave) high-note]
;    [(= (second high-note)
;        (second (first high-octave)))
;     (highest-note (rest high-octave) high-note)]
;    [(> (second high-note)
;        (second (first high-octave)))
;     (highest-note (rest high-octave) high-note)]
;    [(> (second (first high-octave))
;        (second high-note))
;     (highest-note (rest high-octave) (first high-octave))])))
;
;(highest-note '((3 7) (3 4) (3 8)) (list 0 0))
;
;(define (lowest-note notes min-note)
;  (local
;    [(define min-octave (filter (lambda (note) (equal? (first note)
;                                                      (foldr min 9 (map first notes))))
;                               notes))]
;  (cond
;    [(empty? min-octave) min-note]
;    [(= (second min-note)
;        (second (first min-octave)))
;     (lowest-note (rest min-octave) min-note)]
;    [(< (second min-note)
;        (second (first min-octave)))
;     (lowest-note (rest min-octave) min-note)]
;    [(< (second (first min-octave))
;        (second min-note))
;     (lowest-note (rest min-octave) (first min-octave))])))
;
;(lowest-note '((3 7) (3 4) (3 8)) (list 9 13))


(define (range note1 note2)
       (cond
         [(= (first note1) (first  note2))
          (add1 (- (max (second note1) (second note2))
                   (min (second note1) (second note2))))]
         [(= 1 (- (first note1) (first note2)))
          (+ 1 (second note1)
             (- 12 (second note2)))]
         [(= 1 (- (first note2) (first note1)))
          (+ 1 (second note2)
             (- 12 (second note1)))]
         [(> (- (first note1) (first note2)) 1)
          (+ 1 (* 8 (- (first note1) (first note2)))
             (second note1) 
             (- 12 (second note2)))]
         [(> (- (first note2) (first note1)) 1)
          (+ 1 (* 8 (- (first note2) (first note1)))
             (second note2) 
             (- 12 (second note1)))]))
     
     
     ;; i currently only get range b/w values next to each other... must filter brs of notes to get highest and lowest then
     ;; range b/w them... use that for higest range AND bound values then range b/w make it a acc rec fn 
     
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
     
     
     (define (lowest-note notes min-note)
       (local
         [(define min-octave (filter (lambda (note) (equal? (first note)
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
     
     
     ;; make a fn max of bar -- a fn min-of-bar ... and use those to find the max range per bar but still be able to return whole bar !!!
     
     (define (top-range? top-range bar)
       (range (highest-note bar (list 0 0))
              (lowest-note bar (list 9 13))))
     
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
          (top-ranged top-so-far (rest lob))]))
     
     (top-range? 0 '((3 5) (4 8) (2 5) (1 12)))
     
     (highest-note '((3 5) (4 8) (2 5) (1 12)) (list 0 0))
     (lowest-note '((3 5) (4 8) (2 5) (1 12)) (list 9 13))
     (range (list 4 8) (list 1 12))