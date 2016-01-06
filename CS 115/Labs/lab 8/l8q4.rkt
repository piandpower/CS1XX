;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l8q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))


;; Lab 8, Question 4

(define (exponent-without-mult x n)
  (cond [(= n 0) 1]
        [else (exponentiate x n)]))







(define (part1 x)
  (cond [(= x (part1 x)) ]
        [else (add1 (part1  (sub1 l))]))

(check-expect (exponent-without-mult 2 2) 4)
(check-expect (exponent-without-mult 2 5) 32)
  