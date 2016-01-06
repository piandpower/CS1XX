;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |a4q2 working|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
(define (pattern-length str pt1 pt2 lengths)
  (cond
    [(equal? pt2 (string-length str)) (append lengths (list pt2))]
    [(not (equal? (substring str pt1 pt2)
                  (substring str pt2 (add1 pt2))))
     (pattern-length str (add1 pt1) (add1 pt2) (append lengths (list pt2)))]
    [(equal? (substring str pt1 pt2)
             (substring str pt2 (add1 pt2)))
     (pattern-length str (add1 pt1) (add1 pt2) lengths)]))

(pattern-length "AAGCCCCTTAAAAAAAAAA" 0 1 (list 0))

(define (encoder dna-string length-list result-so-far)
  (cond
    [(= 2 (length length-list)) 
     (string-append
      result-so-far
      (substring dna-string (first length-list) (add1 (first length-list)))
      (number->string (- (second length-list) (first length-list))))]
    [else 
     (encoder
      dna-string 
      (rest length-list) 
      (string-append 
       result-so-far
       (substring dna-string (first length-list) (add1 (first length-list)))
       (number->string (- (second length-list) (first length-list)))))]))

(encoder "AAGCCCCTTAAAAAAAAAA" (pattern-length "AAGCCCCTTAAAAAAAAAA" 0 1 (list 0)) "")
(encoder "" (pattern-length "" 0 1 (list 0)) "")