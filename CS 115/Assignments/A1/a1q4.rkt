;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a1q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;***************************************************
;;
;; CS 115 Assignment 1, Question 4
;; Christopher Alert
;;
;; (Calculating total boxes needed to carry bags)
;;
;;****************************************************


;;
;; Constant definitions
;;

;; Capacity of the different box sizes
(define lcap 10)
(define mcap 8)
(define scap 6)

;;bags-after-large: int[>0] int[>=0] -> [>=0]int 
;;purpose: produces the number of bags remaining 
;;to be packed into boxes after some of the total bags
;;num-bags have been packed into the large-boxes number
;;of boxes, that is, if any remain
;;example: (bags-after-large 1 50) => 1
(define (bags-after-large num-bags large-boxes)
  (max (- num-bags (* (tot-lboxes num-bags large-boxes)
                      lcap))
       0))
;;Tests for bags-after-large
  (check-expect (bags-after-large 40 2) 20)
  (check-expect (bags-after-large 1 0) 1)

;; # of l box total
  
;;tot-lboxes: int[>0] int[>=0] -> [>=0]int 
;;purpose: produces the number of large-boxes large sized
;;needed to be packed with bags such that as many of 
;;num-bags as can fit are packed.
;;example: (tot-lboxes 222 30) => 23
(define (tot-lboxes num-bags large-boxes)
  (ceiling (min (/ num-bags lcap) large-boxes)))
;;Tests for tot-lboxes
(check-expect (tot-lboxes 100 5) 5)
(check-expect (tot-lboxes 222 30) 23)
(check-expect (tot-lboxes 300 0) 0)

;; # of med box total

;;tot-mboxes: int[>0] int[>=0] int[>=0] -> [>=0]int 
;;purpose: produces the number of medium sized boxes of
;;the med-boxes number of boxes available needed to be
;;used to pack the remainder of bags after as many of 
;;num-bags as can fit have been put into large-boxes boxes.
;;example: (tot-mboxes 60 0 12) => 10
(define (tot-mboxes num-bags large-boxes med-boxes)
  (ceiling (min (/ (bags-after-large num-bags large-boxes)
                   mcap)
   med-boxes)))
;;Tests for tot-mboxes
(check-expect (tot-mboxes 100 5 1) 1)
(check-expect (tot-mboxes 60 0 12) 8)

;;bags-after-med: int[>0] int[>=0] int[>=0] -> [>=0]int 
;;purpose: produces the number of bags remaining to be
;;packed into boxes after some of the total bags num-bags
;;have been packed into the large-boxes number of boxes 
;;and into the med-boxes number of boxes, that is, 
;;if any remain.
;;example: (bags-after-med 100 0 2) => 84
(define (bags-after-med num-bags  large-boxes med-boxes)
  (max (- (bags-after-large num-bags large-boxes) 
          (* (tot-mboxes num-bags large-boxes med-boxes) mcap)
          )
       0)
  )  
;;Tests for bags-after-med
(check-expect (bags-after-med 100 0 2) 84)
(check-expect (bags-after-med 200 10 5) 60)
  
;;# of small boxes to fill remainder
 
;;tot-sboxes: int[>0] int[>=0] int[>=0] int[>=0] -> [>=0]int 
;;purpose: produces the number of small-boxes small sized
;;needed to be used to pack with the remainder of num-bags bags 
;;such that all bags  are accounted for after large-boxes boxes 
;;and med-boxes boxes were filled with as many bags as can fit.
;;example: (tot-sboxes 60 0 0 12) => 10
(define (tot-sboxes num-bags large-boxes med-boxes small-boxes)
  (ceiling (/ (bags-after-med num-bags large-boxes med-boxes)
              scap)))
;;Tests for tot-sboxes
(check-expect (tot-sboxes 60 0 0 12) 10)
(check-expect (tot-sboxes 200 10 5 100) 10)
(check-expect (tot-sboxes 160 20 100 110) 0)  

;;total boxes

;;total-boxes: int[>0] int[>=0] int[>=0] int[>=0] -> [>=0]int 
;;purpose: produces the total number of large-boxes, small-boxes
;; and med-boxes needed pack away the num-bags bags such that all bags 
;; are accounted for and can be transported in boxes.
;;Example: (tot-sboxes 1000 50 50 50) => 117
(define (total-boxes num-bags large-boxes med-boxes small-boxes)
  (ceiling (+ (tot-lboxes num-bags large-boxes)
              (tot-mboxes num-bags large-boxes med-boxes)
              (tot-sboxes num-bags large-boxes med-boxes small-boxes)
              )
           )
  )
;;Tests for total-boxes
(check-expect (total-boxes 1000 50 50 50) 117)
(check-expect (total-boxes 200 20 0 0) 20)
(check-expect (total-boxes 160 0 100 0) 20)
(check-expect (total-boxes 120 0 0 120) 20)



