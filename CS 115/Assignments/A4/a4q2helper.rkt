;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q2helper) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;;increasing? 

;; (next-value

(define (sublist lon)
  (cond [(empty? lon) empty]
        [(cons? lon) (cons (first (rest lon)) (rest (rest lon)))]))

(sublist (cons 3 (cons 5 (cons 4 (cons 5 empty)))))
(sublist empty)