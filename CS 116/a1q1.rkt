;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a1q1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 Assignment 1, Question 1
;; Christopher Alert
;;
;; (Calculating body mass index)
;;
;;********************************************
 
;;
;; Unit Conversion rates
;;

(define lb-kg-rate 2.2)
(define in-ft-rate 2.54)

;; convert-kg : num[> 0]->num
;;produces equivalent of weight-lb pounds in
;; kilograms
;;Example: (convert-kg 1)=> 0.4545 (appoximate)
;;Example: (convert-kg 244)=> 110.9091 (approximate)
(define (convert-kg weight-lb) (/ weight-lb lb-kg-rate))
;;Tests for convert-kg
(check-within (convert-kg 1) 0.4545 0.0001)
(check-within (convert-kg 244) 110.9091 0.0001)


;; convert-m : int[>= 0]int[>= 0]-> num
;; produces the equivalent of height-ft and height-in
;; in metres
;;Example: (convert-m 5 10)=> 1.778
(define (convert-m height-ft height-in) 
  (/ (* in-ft-rate (+ (* height-ft 12) height-in))100))
;;Tests for convert-m
 (check-within (convert-m 5 10) 1.778 0.0001)
 (check-within (convert-m 0 10) 0.254 0.0001)
 
 
;; calc-bmi : int[>= 0] int[>= 0] int[>= 0]-> num
;;produces the body-mass index of a person of height
;; height-ft, height-in and of weight weight-lb
 ;;Example: (convert-m 5 10 135)=> 19.4110 (approximate)
(define (calc-bmi height-ft height-in weight-lb)
  (/ (convert-kg weight-lb)
  (* (convert-m height-ft height-in)
     (convert-m height-ft height-in)))) 
;;Tests for calc-bmi
(check-within (calc-bmi 5 6 150) 24.2613 0.0001)
(check-within (calc-bmi 0 10 244) 1719.0943 0.0001)



