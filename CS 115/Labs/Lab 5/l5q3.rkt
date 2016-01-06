;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l5q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Lab 5, Question 3

(define-struct card (value suit)) ;; A card is a structure (make-card v s), where
;;v is an integer in the range from 1 to 10 
;;and s is a symbols from the set ’hearts,
;;’diamonds, ’spades, and ’clubs.



(define (bigger-card card1 card2)
  (cond [(> (card-value card1) (card-value card2)) card1]
        [(> (card-value card2) (card-value card1)) card2]
        [(= (card-value card1) (card-value card2)) card2]))
        
  
