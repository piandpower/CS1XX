;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a3q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 3, Question 1                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the area under the graph of a function)    ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;


;; Question 1:

;; Defined Constants:
(define (f1 x) (* 5 (* x x x)))
(define (f2 y) (* 7 (log y)))

;; area-under: (num->num) int[>0] int[>0] -> num
;; Consumes a function f, and two positive integers x1,x2 and produces
;; the area under the graph of the function between the two x values.
;; Examples:
;; (area-under sqr 2 5)=> 29
;; (area-under sqr 0 0)=> 0
;; (area-under f1 10 30)=> 936000
;; (area-under (lambda (x) (- (* x x))) -1 1)=> -1

(define (area-under f x1 x2)
  (local
    [;; reimann-acc: num int int-> num
     ;; Consumes sum, xi and xn and produces the sum of
     ;; the functions evaluated at the points between.
     (define (reimann-acc sum xi xn)
       (cond
         [(= xi xn) sum]
         [else (reimann-acc (round (+ (f xi) sum)) (add1 xi) xn)]))]
    (reimann-acc 0 x1 x2)))
;;Tests:
(check-expect (area-under sqr 2 5) 29)
(check-expect (area-under sqr 0 0) 0)
(check-expect (area-under f1 10 30) 936000)
(check-within (area-under f2 2 8) #i60.0 60.0)
(check-expect (area-under (lambda (x) (* 1.5 x)) 1 2) 2)
(check-expect (area-under (lambda (x) (- (* x x))) -1 1) -1)

