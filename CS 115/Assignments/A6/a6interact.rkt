;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a6interact) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 6, Question 1
;; Christopher Alert
;;
;;(Calculating the amount of money left on Chuckie Lucky's
;; bank account or if he has overdrawn)
;;
;;*********************************************************

;;Assignment 6

(define-struct clock (hours mins))
;; A clock is a structure (make-clock h m), where
;; 	h is an integer in the range from 0 to 23 and
;; 	m is an integer in the range from 0 to 59.

(define-struct flight (from to departure duration))
;; An flight is a structure (make-flight f t d du) where
;; 	f is a string representing the origin of the flight,
;; 	t is a string representing the destination of the flight,
;; 	d is a clock structure representing the departure time, and
;; 	du is a natural number representing the flight time in minutes.

(define-struct scorecard (name scores))
;; A scorecard is a structure (make-scorecard n s), where
;; 	n is a string representing the name of a golfer and
;; 	s is a list of natural numbers representing the numbers 
;;      of strokes made by the player.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helper functions for Question 1 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define century-leap 400)
(define century-non-leap 100)
(define general-leap 4)

;; is-multiple?: nat nat -> boolean
;; produces true if m is a multiple of n, false othewise.
;; example: (is-multiple? 15 3) => true, 
;           (is-multiple? 8 3) => false
(define (is-multiple? m n)
  (zero? (remainder m n)))
(check-expect (is-multiple? 10 3) false)
(check-expect (is-multiple? 10 5) true)
(check-expect (is-multiple? 10 10) true)
(check-expect (is-multiple? 10 15) false)

;; is-leap-year?: nat -> boolean
;; produces true if yr is a leap year, and false otherwise.
;; note that a yr is a leap year if it is divisible by 4, 
;; unless it is divisible by 100 but not 400. Zero is not 
;; a leap year.
;; example: (is-leap-year 1900) => false 
;; (is-leap-year 2000) => true, (is-leap-year 2012) => true
(define (is-leap-year? yr)
  (cond
    [(zero? yr) false]
    [(is-multiple? yr century-leap) true]
    [(is-multiple? yr century-non-leap) false]
    [(is-multiple? yr general-leap) true]
    [else false]))
(check-expect (is-leap-year? 0) false)
(check-expect (is-leap-year? 1900) false)
(check-expect (is-leap-year? 2000) true)
(check-expect (is-leap-year? 2012) true)
(check-expect (is-leap-year? 2010) false)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 1
(define (cumulative-interest start-yr retire-yr)
  ...)

;; Question 2
(define (make-digit-list n d)
  ...)

;; Question 3
(define (match-play lscore1 lscore2)
  ...)

;; Question 4
(define (minimum-waiting-time w-lof v-lof)
  ...)