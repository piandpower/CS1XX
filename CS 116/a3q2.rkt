;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a3q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 3, Question 2                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the size a laputa crystal grows to after   ;;
;; a certain number of miliseconds.                       ;;
;;                                                        ;;
;;********************************************************;;
;;


;; Question 2: 

;; laputa-volume: int[>0] -> int[>0]
;; Consumes an integer t and produces the volume of a laputa
;; crystal after t miliseconds.
;; Examples:
;; (laputa-volume 0)=> 1
;; (laputa-volume 2)=> 6
;; (laputa-volume 6)=> 5040
;; (laputa-volume 10)=> 39916800
;;
(define (laputa-volume t)
  (local
    [;; laputa-growth: nat nat nat nat-> nat
     ;; Consumes four natural numbers, ms, x,y,and z and
     ;; produces the size of a laputa crystal after ms miliseconds.
     (define (laputa-growth ms x y z)
       (cond
         [(= (add1 t) ms) (* x y z)]
         [(zero? ms) (laputa-growth (add1 ms) x y z)]
         [(= 1 (modulo ms 3)) (laputa-growth (add1 ms) (* x (add1 ms)) y z)]
         [(= 2 (modulo ms 3)) (laputa-growth (add1 ms) x (* (add1 ms) y) z)]
         [(zero? (modulo ms 3)) (laputa-growth (add1 ms) x y (* (add1 ms) z))]))]
    (laputa-growth 0 1 1 1)))
;; Tests:
(check-expect (laputa-volume 0) 1)
(check-expect (laputa-volume 2) 6)
(check-expect (laputa-volume 6) 5040)
(check-expect (laputa-volume 10) 39916800)


