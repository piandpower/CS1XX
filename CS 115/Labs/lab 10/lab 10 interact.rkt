;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |lab 10 interact|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct bae (fn arg1 arg2))
;; A binary arithmetic expression (binexp) is either 
;;      a number or
;;      a structure (make-bae f a1 a2), where
;;           f is a symbol in the set '*, '+, '/, '-,
;;           a1 is a binexp, and
;;           a2 is a binexp.

(define-struct node (key val left right))
;; A binary search tree (BST) is either 
;;      empty or 
;;      a structure (make-node k v lft rgt), where 
;;           k is a number,
;;           v is a string, 
;;           lft is a BST, and
;;           rgt is a BST.
;; In addition, the keys in lft are all less than k
;; and the keys in rgt are all greater than k.

;; Lab 10, Question 2

(define (is-ancestor-of? anc desc)
  ...)

;; Lab 10, Question 3

(define (desc-list t)
  ...)

;; Lab 10, Question 4

(define (odd-lengths root)
  ...)

;; Lab 10, Question 5

(define (leftmost btree)
  ...)