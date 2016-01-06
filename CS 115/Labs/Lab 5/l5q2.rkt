;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l5q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;Lab 5 q2


(define-struct timer (hours mins secs)) 
;; An timer is a structure (make-timer h m s), where
;;h is a natural number,
;; m is an integer in the range from 0 to 59,
;;  and s is an integer in the range from 0 to 59.

;; Lab 5, Question 2

(define (hr-sec t)
  (* (timer-hours t) 360))

(define (min-sec t)
  (* (timer-mins t) 60))


(define (convert-time t)
  (+ (hr-sec t)
     (min-sec t)
     (timer-secs t)))
 

(Question 2, Test 2, 1 marks): Checking if (convert-time (make-timer 10 10
   10)) produces 36610: FAILED; expected 36610, saw 4210
(Question 2, Test 3, 1 marks): Checking if (convert-time (make-timer 0 5 0))
   produces 300: Passed
(Question 2, Test 4, 1 marks): Checking if (convert-time (make-timer 1 0 0))
   produces 3600: FAILED; expected 3600, saw 360
(Question 2, Test 5, 1 marks): Checking if (convert-time (make-timer 60 59
   59)) produces 219599: FAILED; expected 219599, saw 25199
(Question 2, Test 6, 1 marks): Checking if (convert-time (make-timer 2 49 3))
   produces 10143: FAILED; expected 10143, saw 3663
(Question 2, Test 7, 1 marks): Checking if (convert-time (make-timer 2 3 0))
   produces 7380: FAILED; expected 7380, saw 900

