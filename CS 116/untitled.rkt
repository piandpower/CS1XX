;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname untitled) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;***************************************************
;; CS 115 Lab 3 , Question 1
;;Christopher Alert
;;
;;(Calculating total boxes needed to carry bags)
;;****************************************************








;; Assignment 1, Question 4


(define lcap 10)
(define mcap 8)
(define scap 6)

;;# of boxes after l filled
(define (bags-after-large num-bags large-boxes)
  (max (- num-bags (* (tot-lboxes num-bags large-boxes) lcap)) 0))



;; # of l box total
(define (tot-lboxes num-bags large-boxes)
  (min (/ num-bags lcap) large-boxes))             ;; number of large boxes taken up
     

;; # of med box total
(define (tot-mboxes num-bags large-boxes med-boxes)
  (min (/ (bags-after-large num-bags large-boxes) mcap)
   med-boxes))
  
;; # of bags rem after m boxes filled
(define (bags-after-med num-bags  large-boxes med-boxes)
  (max (- (bags-after-large num-bags large-boxes) (* (tot-mboxes num-bags large-boxes med-boxes) mcap)) 0)
  )  
  
  ;;# of small boxes to fill remainder
  
(define (tot-sboxes num-bags large-boxes med-boxes small-boxes)
  (/ (bags-after-med num-bags large-boxes med-boxes) scap))
  

;;total boxes

(define (total-boxes num-bags large-boxes med-boxes small-boxes)
  (ceiling (+ (tot-lboxes num-bags large-boxes)
              (tot-mboxes num-bags large-boxes med-boxes)
              (tot-sboxes num-bags large-boxes med-boxes small-boxes))))
             

