;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*********************************************************
;; CS 115 Assignment 4, Question 2
;;
;; Christopher Alert
;;
;;(Evaluating if a list of numbers is in increasing order)
;;
;;*********************************************************

;; Assignment 4, Question 2


;;increasing-order: (listof num) -> (listof num)
;;Consumes a list of numbers ,lon, and produces true if
;;the list of numbers is in ascending order from lowest
;;to highest or if its a single value list.
;;Examples:(increasing-order? (cons -2.3 (cons 0 empty)))=> true
;;(increasing-order? empty)->true
;;(increasing-order? (cons 1 empty)=> true
(define (increasing-order? lon)
  (cond
    [(empty? lon) true]
    [(and (number? (first lon)) (equal? 1 (length lon))) true]
    [(and (number? (first lon)) 
          (< (first lon) (first (rest lon)))) (increasing-order? (rest lon))]
    [else false]))
;;Tests
(check-expect (increasing-order? empty) true)
(check-expect (increasing-order? (cons 1 empty)) true)
(check-expect (increasing-order? (cons 2 (cons 2 (cons 5 empty)))) false)
(check-expect (increasing-order? (cons -2.3 (cons 0 empty))) true)

