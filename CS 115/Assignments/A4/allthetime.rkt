;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname allthetime) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;long-enough? (listof str) num->
(define (long-enough? los avg)
  (cond [(>= (string-length(first los)) avg) true]             ;(cons (first los) (long-strings (rest los)))]
        [(< (string-length (first los)) avg) (long-strings (rest los))]))
(check-expect long-enough (cons "one" (cons "four"(cons "fives" empty)))) 4)

(define avg (avg-str-length los))


(define (long-strings los)
  (cond [(empty? los) empty]
        [(long-enough? los avg) (cons (first los) (long-enough? (rest los)))]))