;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a1q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 ;; Assignment 1, Question 2
;; Christopher Alert
;;
;; (Calculating the distance travelled by a runner
;;  in interval training)
;;
;;********************************************


;; distance walked

;;walk-dist: num num num -> num
;;Produces distance walked at walk-rate km/hr
;; during walking minute intervals over the  
;; portion of total-time not made up by running 
;; intervals in run-time.
;;Examples: (walk-dist 4 6 80)=>0.73
(define (walk-dist walk-rate run-time total-time)
         (* walk-rate (/ (quotient total-time (+ run-time 1))
                         60)))
;; Tests for walk-dist
(check-within (walk-dist 4 6 80) 0.73333 0.0001)

;;distance run

;;run-dist: num num num -> num
;; Produces distance run at run-rate km/hr over
;; the portion of time run-time spent in running
;; intervals as opposed to walking intervals 
;; within run-time.
;; Examples: (run-dist 5 90 600)=> 49.5
;;(calc-distance 6.3 12.5 4 52)=>9.8
(define (run-dist run-rate run-time total-time)
         (+ (* run-rate (/ (* (quotient total-time (+ run-time 1))
                              run-time) 60))
            (* run-rate (/ (remainder total-time (+ run-time 1))
                           60))))
;;Tests for run-dist
(check-expect (run-dist 5 90 600) 49.5)

;; calc-distance: num num num num-> num
;; Produces total of distance walked at walk-rate and
;; run at run-rate over the run-time period of total-time
;;  both walking and running intervals.
;;Examples: (check-expect(calc-distance 6.3 12.5 4 52)=> 9.8
(define (calc-distance walk-rate run-rate run-time total-time)
  (+ (walk-dist walk-rate run-time total-time)
     (run-dist run-rate run-time total-time)))
;;Tests for calc-distance
(check-expect(calc-distance 6.3 12.5 4 52) 9.8)
