;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a6q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 6, Question 4
;; Christopher Alert
;;
;;(Calculating the smallest waiting time between connecting 
;; flights that a person )
;;
;;*********************************************************

;; Question 4

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

;;Defined Constants:
(define W7 (make-flight "Waterloo" "Vancouver" (make-clock 7 55) 300)) 
(define W11 (make-flight "Waterloo" "Vancouver" (make-clock 11 25) 295)) 
(define W21 (make-flight "Waterloo" "Vancouver" (make-clock 21 0) 300))
(define W22 (make-flight "Waterloo" "Vancouver" (make-clock 22 10) 310))
(define V3 (make-flight "Vancouver" "Hongkong" (make-clock 3 55) 610)) 
(define V6 (make-flight "Vancouver" "Hongkong" (make-clock 6 55) 605)) 
(define V10 (make-flight "Vancouver" "Hongkong" (make-clock 10 5) 599))
(define V13 (make-flight "Vancouver" "Hongkong" (make-clock 13 25) 600))
(define V22 (make-flight "Vancouver" "Hongkong" (make-clock 22 30) 608))
(define WC (make-flight "Waterloo" "Vancouver" (make-clock 0 00) 1)) 
(define VC (make-flight "Vancouver" "Hongkong" (make-clock 23 58) 1000))
(define sunday-schedule-W (list WC))
(define sunday-schedule-V (list VC))
(define result1 (list 370 1440 1440))
(define result2 (list 30 370 1440 1440))
(define twelve (make-clock 12 12))
(define ten (make-clock 10 10))
(define daybreak (make-clock 0 00))

;;min-clock: clock -> clock
;;Consumes a clock, time, and produces the time in minutes
;;Examples:
;;(min-clock twelve)=> (make-clock 0 732)
;;(min-clock ten)=> (make-clock 0 610)
;;(min-clock twelve)=> (make-clock 0 732)
;;(min-clock daybreak)=> (make-clock 0 0))
(define (min-clock time)
  (make-clock 0 (+ (* (clock-hours time) 60) (clock-mins time))))
;;Tests:
(check-expect (min-clock twelve) (make-clock 0 732))
(check-expect (min-clock ten) (make-clock 0 610))
(check-expect (min-clock daybreak) (make-clock 0 0))

;;arrival-time: flight -> clock
;;Consumes a flight and produces the time at which the flight
;;is expected to arrive in the destination location in minute time.
;;Examples:
;;(arrival-time WC)=> (make-clock 0 01)
;;(arrival-time VC)=> (make-clock 0 2438)
;;(arrival-time W7)=> (make-clock 0 775)
;;(arrival-time V6)=> (make-clock 0 1020)
(define (arrival-time flight)
  (make-clock 0 (+ (clock-mins(min-clock (flight-departure flight)))
                   (flight-duration flight))))
;;Tests:
(check-expect (arrival-time WC) (make-clock 0 01))
(check-expect (arrival-time VC) (make-clock 0 2438))
(check-expect (arrival-time W7) (make-clock 0 775))
(check-expect (arrival-time V6) (make-clock 0 1020))

;;t-betwen: clock clock -> num
;;Consumes two clock times , time1 and time2 and produces the number of
;;minutes between the two times.
;;Examples:
;;(t-betwn (make-clock 4 57) (make-clock 4 56))=> 1
;;(t-betwn (make-clock 5 57) (make-clock 4 57))=> 60
;;(t-betwn (make-clock 4 57) (make-clock 5 57))=> 0
(define (t-betwn time1 time2)
  (max 0 (- (clock-mins (min-clock time1)) (clock-mins (min-clock time2)))))
;;Tests:
(check-expect (t-betwn (make-clock 4 57) (make-clock 4 56)) 1)
(check-expect (t-betwn (flight-departure W22)
                       (flight-departure W21)) 70)
(check-expect (t-betwn (make-clock 5 57) (make-clock 4 57)) 60)
(check-expect (t-betwn (make-clock 12 57) (make-clock 20 57)) 0)


;;connecting-waits:(listof clock) (listof flight)-> (listof flight)
;;Consumes the list of waterloo and vancouver flights and
;;produces the list of waiting times for connecting flights
;;to Hong kong
;;Examples:
;;(connecting-waits W7 (list V3 V10 V13 V22))=> (list 30 575)
;;(connecting-waits W11 (list V3 V10 V13 V22))=> (list 370)
;;(connecting-waits WC sunday-schedule-V)=> (list 1437)
(define (connecting-waits flight v-lof)
  (cond [(empty? v-lof) empty]
        [(>= (t-betwn (flight-departure (first v-lof)) (arrival-time flight)) 30) 
         (cons (t-betwn (flight-departure (first v-lof)) (arrival-time flight))
               (connecting-waits flight (rest v-lof)))]
        [else (connecting-waits flight (rest v-lof))]))
;;Tests:
(check-expect (connecting-waits W7 (list V3 V10 V13 V22)) (list 30 575))
(check-expect (connecting-waits WC sunday-schedule-V) (list 1437))
(check-expect (connecting-waits W11 (list V3 V10 V13 V22)) (list 370))

;;best-connection: (listof nat)-> nat
;;Consumes a list of natural numbers representing the minimum waiting
;;times for each flight and then produces the smallest waiting time.
;;Examples:
;;(best-connection (list 30 575))=> 30
;;(best-connection (list 783 456 185 575))=> 185
;;(best-connection (list 999 888 777 666 252 648 963 112 345 30))=> 30
;;(best-connection (list 30))=> 30
(define (best-connection timelist)
  (cond
    [(empty? timelist) 1440]
    [(empty? (rest timelist)) (first timelist)]
    [else 
     (min (first timelist)
          (best-connection (rest timelist)))]))
;;Tests:
(check-expect (best-connection (list 30 575)) 30)
(check-expect (best-connection (list 783 456 185 575)) 185)
(check-expect 
 (best-connection (list 999 888 777 666 252 648 963 112 345 30)) 30)
(check-expect (best-connection (list 1437)) 1437)


;;wait-schedule: (listof flight)-> (listof nat)
;;Consumes w-lof and v-lof, flight schedules and produces the list of the
;;smallest connection times between each waterloo to vancouver flight and
;; hong kong flights
;;Examples:
;;(wait-schedule sunday-schedule-W sunday-schedule-V)=> (list 1437)
;;(wait-schedule (list W7 W11 W21 W22) (list V3 V10 V13 V22))=>
;; (list 30 370 1440 1440)
;;(wait-schedule (list W11 W21 W22) (list V3 V10 V13 V22))=> 
;; (list 370 1440 1440)
(define (wait-schedule w-lof v-lof)
  (cond[(empty? w-lof) empty]
       [else (cons (best-connection (connecting-waits (first w-lof) v-lof))
                   (wait-schedule (rest w-lof) v-lof))]))
;;Tests:
(check-expect 
 (wait-schedule (list W11 W21 W22) (list V3 V10 V13 V22)) 
 (list 370 1440 1440)) 
(check-expect 
 (wait-schedule (list W7 W11 W21 W22) (list V3 V10 V13 V22))
 (list 30 370 1440 1440))
(check-expect (wait-schedule sunday-schedule-W sunday-schedule-V)
              (list 1437))

;;minimum-waiting-time: (listof flight) (listof flight)-> nat
;;Consumes two lists of flights, w-lof and v-lof and produces the minimum
;; time between connecting flights that one would have to wait based on 
;;available flights.
;;Examples:
;;(minimum-waiting-time (list W7 W11 W21 W22) (list V3 V10 V13 V22)) 30
;;(minimum-waiting-time (list W7) (list V6 V22)) 575
;;(minimum-waiting-time(list W7 W11 W21) (list V6 V10 V22))=> 370 
;;(minimum-waiting-time sunday-schedule-W sunday-schedule-V)=> 1437
(define (minimum-waiting-time w-lof v-lof)
  (best-connection (wait-schedule w-lof v-lof)))
;;Tests:
(check-expect 
 (minimum-waiting-time (list W7 W11 W21 W22) (list V3 V10 V13 V22)) 30)
(check-expect 
 (minimum-waiting-time (list W7) (list V6 V22)) 575)
(check-expect 
 (minimum-waiting-time (list W7 W11 W21) (list V6 V10 V22)) 370)
(check-expect 
 (minimum-waiting-time (list W11 W21 W22) (list V3 V10 V13 V22)) 370)
(check-expect 
 (minimum-waiting-time sunday-schedule-W sunday-schedule-V) 1437) 
