;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname allthetime!) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(define (long-strings los)
  (cond [(empty? los) empty]
        [else (long-enough? los (avg-str-length los (total-str-length los)))])) 
;;Tests
(check-expect (long-strings (cons "blah" empty)) (cons "blah" empty))
(check-expect (long-strings (cons "one" (cons "four"(cons "fives" empty))))
                            (cons "four"(cons "fives" empty)))

