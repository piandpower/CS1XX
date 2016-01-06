;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname labinterface12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct card (value suit))
;; A card is a structure (make-card v s), where
;;      v is an integer in the range 1 to 10 and
;;      s is a symbol in the set 'hearts, 'diamonds, 'spades, and 'clubs.

;; Lab 12, Question 2

(define (find-hearts clist)
  ...)

;; Lab 12, Question 3

(define (count-suit clist asuit)
  ...)

;; Lab 12, Question 4

(define (switch-case str)
 ...)

;; Lab 12, Question 5

(define (count-even-strings alist)
  ...)