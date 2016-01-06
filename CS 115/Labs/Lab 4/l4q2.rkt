;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l4q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Lab 4, Question 2

 
(define (in-subset-1? x)
  (cond
    [(equal? 3 x) true]
    [(equal? 7 x) true]
    [else false]))

(define (in-subset-2? x)
 (cond
    [(equal? 3 x) true]
    [(equal? 1 x) true]
    [(equal? 11 x) true]
    [(equal? 9 x) true]
    [else false]))

(define (in-subset-3? x)
   (cond
     [(equal? 1 x) false]
     [(equal? 3 x) false]
     [else true]))
 