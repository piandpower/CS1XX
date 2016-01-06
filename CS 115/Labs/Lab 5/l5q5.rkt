;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l5q5) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Lab 5, Question 5

(define-struct clock (hours mins)) 
;; A clock is a structure (make-clock h m), where 
;;	h is an integer in the range from 0 to 23 and
;;	m is an integer in the range from 0 to 59.


(define (hrs-mins time1 time2)
  (cond [(> (clock-hours time2) (clock-hours time1)) (* (- (clock-hours time2) (clock-hours time1)) 60)]
        [(> (clock-hours time1) (clock-hours time2)) (+ (* (- 24 (clock-hours time1)) 60) 
                                                        (* (clock-hours time2) 60))]))

(define (mins-betwn time1 time2)
  (cond [(< (clock-mins time1) (clock-mins time2)) (- (clock-mins time1) (clock-mins time2))]
        [(> (clock-mins time2) (clock-mins time1)) (+ (- 60 (clock-mins time1)) (clock-mins time2))]
        [(and (= (clock-hours time1) (clock-hours time2))
              (= (clock-mins time1) (clock-mins time2))) 0]
        [(and (> (clock-hours time1) (clock-hours time2))
              (= (clock-mins time1) (clock-mins time2))) 0]
        [else (+ (- 60 (clock-mins time1)) (clock-mins time2))]))


(define (dur time1 time2)
  (+ (hrs-mins time1 time2)
     (mins-betwn time1 time2)))

;;Tests:
(check-expect (dur (make-clock 23 44) (make-clock 9 44)) 600)

(dur (make-clock 3 25) (make-clock
   5 40)) produces 135
          
          (Question 5, Test 2, 1 marks): Checking if (dur (make-clock 23 30) (make-clock
   0 20)) produces 50: FAILED; expected 50, saw 110
(Question 5, Test 3, 1 marks): Checking if (dur (make-clock 9 20) (make-clock
   9 10)) produces 1430: FAILED; Exception234 caught when running test: cond:
   all question results were false
(Question 5, Test 4, 1 marks): Checking if (dur (make-clock 7 20) (make-clock
   8 10)) produces 50: FAILED; expected 50, saw 110
(Question 5, Test 5, 1 marks): Checking if (dur (make-clock 7 20) (make-clock
   7 20)) produces 0: FAILED; Exception234 caught when running test: cond:
   all question results were false
(Question 5, Test 6, 1 marks): Checking if (dur (make-clock 14 3) (make-clock
   14 39)) produces 36: FAILED; Exception234 caught when running test: cond:
   all question results were false
(Question 5, Test 7, 1 marks): Checking if (dur (make-clock 0 0) (make-clock
   23 59)) produces 1439: FAILED; expected 1439, saw 1321
  

