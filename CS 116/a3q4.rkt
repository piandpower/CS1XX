;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a3q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 3, Question 4                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the number of hours of idle time in a day  ;;
;; for a given computer)                                  ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;

(define mc '("MC2037-1" (0 1 1 1 1 1 1 0 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0 0)))
(define dcexamtime '("MC2037-9" (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)))
(define mccaf '("MC2037-21" (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)))
(define last '("MC2026-3" (0 1 0 0 1 1 1 0 0 0 0 1 1 1 1 1 1 0 0 0 0 1 0 1)))

;; Question 4:

;; longest-idle-period: (listof (union string (listof nat)))
;;                      ->(listof (union string (listof nat)))
;; Consumes one-computer-usage, containing information about the hours
;; a computer was used during a day and produces a list with the 
;; computer name and the start-time of the longest idle period as well
;; as its duration.
;; Examples:
;; (longest-idle-period dcexamtime)=> (list "MC2037-9" 0 0)
;; (longest-idle-period dcexamtime)=> (list "MC2037-9" 0 0)
;; (longest-idle-period mccaf)=> (list "MC2037-21" 0 24)
;; (longest-idle-period last)=> (list "MC2026-3" 7 4)
;;
(define (longest-idle-period one-computer-usage)
  (local
    [;; idle-finder: nat nat nat nat nat (listof (union string (listof nat)))
     ;;             -> (listof string nat nat)
     ;; Consumes natural numbers ,t ,idle-end, max-idle-start, max-idle, 
     ;; idle-duration, and a ist with a string of the computer lab name
     ;; and usage times, usage, and produces a list with the lab name and
     ;; the start time of the day's longest idle period and the duration of
     ;; the day's longest idle period.
     (define (idle-finder t idle-end max-idle-start max-idle idle-duration usage)
       (cond
         [(empty? usage) (list (first one-computer-usage) max-idle-start max-idle)]
         [(and (zero? (first usage))
               (empty? (rest usage)))
          (idle-finder (add1 t) (add1 t) max-idle-start (max (add1 idle-duration) max-idle) (add1 idle-duration) (rest usage))]
         [(and (zero? (first usage))
               (zero? (first (rest usage))))
          (idle-finder (add1 t) (add1 t) max-idle-start max-idle (add1 idle-duration) (rest usage))]
         [(and (zero? (first usage))
               (= 1(first (rest usage)))
               (= max-idle (max max-idle (add1 idle-duration))))
          (idle-finder (add1 t) (add1 t) max-idle-start max-idle 0 (rest usage))]
         [(and (zero? (first usage))
               (= 1 (first (rest usage)))
               (= (add1 idle-duration) (max max-idle (add1 idle-duration))))
          (idle-finder (add1 t) (add1 t) (- t idle-duration) (add1 idle-duration) 0 (rest usage))]  
         [else (idle-finder (add1 t) (+ 2 t) max-idle-start max-idle idle-duration (rest usage))]))]
    (idle-finder 0 0 0 0 0 (second one-computer-usage))))
;;Tests:
(check-expect (longest-idle-period mc) (list "MC2037-1" 7 7))
(check-expect (longest-idle-period dcexamtime) (list "MC2037-9" 0 0))
(check-expect (longest-idle-period mccaf) (list "MC2037-21" 0 24))
(check-expect (longest-idle-period last) (list "MC2026-3" 7 4))

