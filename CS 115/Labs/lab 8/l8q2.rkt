;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l8q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))




(define (repeat n symb)
  (cond [(= n 0) empty]
        [(> n 0) (cons symb (repeat (sub1 n) symb))]))
;;Tests:
(check-expect (repeat 5 'goat) (cons 'goat (cons 'goat (cons 'goat (cons 'goat(cons 'goat empty))))))
  