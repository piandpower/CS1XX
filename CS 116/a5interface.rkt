;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a5interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface file for A5 (Mutation)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Question 1

;; State Variables:
;; NOTE: We will be changing these values for the auto-testing of part (A).
;; Your function should make no assumptions about the values of a...f
;; in part (A). In part (B), assume the state variables have the values they
;; would have if first-map (part B) ran correctly.

;; a,b,c,d,f: any
;; initial values
(define a (void))
(define b (void))
(define c (void))
(define d (void))
(define f (void))

;; Structures:
(define-struct tweet (sender message))
;; A tweet is a structure (make-tweet s m) where
;;   s is a string for the sender's name,
;;   m is a string for the sender's message (with maximum length 140 characters)

;; (part A)
(define (first-mutate)
  ...)


;; (part B)
(define (second-mutate)
  ...)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Question 2

(define-struct node (value next))
;; A node is a structure (make-node v n) where
;;   v is an integer, and
;;   n is either a node or the symbol 'end

;; State Variables:
;; NOTE: We will be changing these values for auto-testing in this question.
;; Your function should make no assumptions about the values of a-linked-list 
;; and a-node except that 
;;  (1) a-linked-list initially has at least 3 nodes in it for part (A), and has at 
;;      least one node in it for parts (B) and part (C).
;;  (2) a-node initially has one node for part (A).  

;; a-linked-list: (listof node)
;; initial value
(define a-linked-list (make-node 3 (make-node 17 (make-node -1 (make-node 22 'end)))))

;; a-node: node
;; initial value
(define a-node (make-node 99 'end))

;; (Part A)
(define (add-a-node)
  ...)
  
;; (Part B)
(define (remove-second)
  ...)
  
;; (Part C)
(define (add-second n)
  ...)
  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Question 3

;; state variable
;; NOTE: We will be changing the initial value of words for auto-testing of this question.
;; Your function should make no assumptions about words except that is a list of 
;; strings and contains at least one string.

;; words: (listof string)
;; initial value 
(define words (list "Lions" "Tigers" "Bears" "Oh, my!"))

(define (next-word)
  ...)

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Question 4

(define-struct string-wrapper (text))
;; A string-wrapper is a structure (make-string-wrapper s) where
;;   s is a string whose elements (characters) can only be one of
;;   (a) the underscore character "_"
;;   (b) the period character "."
;;   (c) the 26 lower-case Latin alphabet characters "a", "b", "c", ..., "x", "y", "z"

;; (Part A)
(define (caesar-encrypt m)
  ...)

;; (Part B)
(define (caesar-decrypt c)
  ...)


  
