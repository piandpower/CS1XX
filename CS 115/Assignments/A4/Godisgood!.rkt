;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Godisgood!) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Consumes a list of strings, los, and produces the sum of the lengths of the strings

(define (total-str-length los)
           (cond [(empty? los) 0]
                 [(empty? (rest los)) (string-length (first los))]
                 [else (+ (string-length (first los)) (total-str-length (rest los)))]))
;;Tests:
(check-expect (total-str-length empty) 0)
(check-expect (total-str-length (cons "one" (cons "four"(cons "fives" empty)))) 12)


;;consumes a list of strings and the total length of the list of strings 
;;and produces the average length of the string
(define (avg-str-length los)
  (/ (total-str-length los) (length los)))
;;Tests:
(check-expect (avg-str-length (cons "one" (cons "four"(cons "fives" empty)))) 4)


(define (long-strings? los benchmark)
  (cond [(empty? los) empty]
        [(>= (length (string->list (first los))) benchmark) (cons (first los) (long-strings? (rest los) benchmark))]
        [else (long-strings? (rest los) benchmark)]))


(define (long-strings los)
 (cond
   [(empty? los) empty]
   [(empty? (rest los)) los]
   [else (long-strings? los (avg-str-length los))]))
;;Tests:

(check-expect (long-strings (cons "short" (cons "longer" (cons "longest" empty)))) (cons "longer" (cons "longest" empty)))
(check-expect (long-strings (cons "one" (cons "four"(cons "fives" empty))))
                            (cons "four"(cons "fives" empty)))