;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |a4q3 working|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
(define (length-finder str pt1 pt2 length-list acc-num)
  (cond
    [(and (equal? pt2 (string-length str))
          (number? (string->number (substring str pt1 pt2))))
     (append length-list (list (+ (string->number (substring str pt1 pt2))
                                  (* 10 acc-num))))]
    [(not (number? (string->number (substring str pt1 pt2))))
     (length-finder str (add1 pt1) (add1 pt2) (append length-list (list acc-num)) 0)]
    [(number? (string->number (substring str pt1 pt2)))
     (length-finder str (add1 pt1) (add1 pt2) length-list
                    (+ (* acc-num 10) (string->number (substring str pt1 pt2))))]))

(length-finder "A2G1C3T2A10" 0 1 empty 0)

(define (decoder dna-string length-list result-so-far)
  (cond
    [(empty? length-list) result-so-far]
    [else 
     (decoder (substring dna-string 2)
              (rest length-list)
              (string-append 
               result-so-far
               (make-string (first length-list) (string-ref dna-string 0))))]))

(decoder "A2G1C3T2A10" (filter (lambda (x) (not (zero? x))) (list 0 2 1 3 2 10)) "")
                             