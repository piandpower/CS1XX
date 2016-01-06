;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a7q3) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 7, Question 3                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining whether the key, value pairs of an         ;;
;; association list are present in a binary search tree)  ;;
;;                                                        ;;
;;********************************************************;;



(define-struct node (key val left right))
;; A binary search tree (bst) is empty, or a structure
;; (make-node k v l r), where k is a number (for the key), 
;; v is a string (for the associated value), and l,r are bst.
;; In addition, every key in l is less than k, and every key 
;; in r is greater than k.

;; An association list (al) is empty, or (cons (list k v) alst), 
;; where k is a number (for the key), v is a string (for the 
;; associated value), and alst is an al.

;; Question 3


;; in-list?: node (listof string)-> boolean
;;Produces true is the key and value, that is, the first and second,
;; members of a list correspond to the same number string combination
;; in the binary search tree.
;;Examples:
;;(in-list? empty (list (list 3 "NO")))=> false
;;(in-list? (make-node 3 "NO" empty empty) empty)=> false
;;(in-list? (make-node 3434 "joe" 
;;                     (make-node 1111 "tom" empty empty)
;;                     (make-node 5454 "jane" empty empty)) 
;;          (list 1111 "tom"))=> true
(define (in-list? tree lst)
  (cond [(or 
          (empty? tree)
          (empty? lst)) false]
        [(and (equal? (first lst) (node-key tree))
              (equal? (second lst) (node-val tree))) true]
        [(> (first lst) (node-key tree)) (in-list? (node-right tree) lst)]
        [(< (first lst) (node-key tree)) (in-list? (node-left tree) lst)]
        [else false]))
;;Tests:
(check-expect
 (in-list? (make-node 3434 "joe" 
                     (make-node 1111 "tom" empty empty)
                     (make-node 5454 "jane" empty empty)) 
          (list 1111 "tom")) true)
(check-expect (in-list? empty (list (list 3 "NO"))) false)
(check-expect (in-list? (make-node 3 "NO" empty empty) empty) false)


;;dictionary=?: node al-> bolean
;;Produces true is the key and value pairs in alst are also present
;; in the same combinations in the binary search tree tree.
;;Examples:
;;(dictionary=? empty (list (list 3 "three")))=> false
;;(dictionary=? 
;;  (make-node 3434 "joe" 
;;            (make-node 1111 "tom" empty empty)
;;            (make-node 5454 "jane" empty empty)) 
;;  (list (list 1111 "tom") (list 5454 "jane") (list 3434 "joe")))=>true
;;(dictionary=? empty (list (list 3 "NO")))=> false
(define (dictionary=? tree alst)
  (cond 
    [(empty? (rest alst)) (in-list? tree (first alst))]
    [(in-list? tree (first alst)) 
     (dictionary=? tree (rest alst))]
    [else false]))
;;Tests:
(check-expect 
 (dictionary=? 
  (make-node 3434 "joe" 
             (make-node 1111 "tom" empty empty)
             (make-node 5454 "jane" empty empty)) 
  (list (list 1111 "tom") (list 5454 "jane") (list 3434 "joe"))) true)
(check-expect (dictionary=? empty (list (list 3 "three"))) false)
(check-expect (dictionary=? empty (list (list 3 "NO"))) false)
(check-expect (dictionary=? empty (list (list 3 "three"))) false)
(check-expect 
 (dictionary=? 
  (make-node 3434 "joe" 
             (make-node 1111 "to" empty empty)
             (make-node 5454 "jane" empty empty)) 
  (list (list 1111 "tom") (list 5454 "jane") (list 3434 "joe"))) false)
(check-expect 
 (dictionary=? 
  (make-node 3434 "joe" 
             (make-node 111 "tom" empty empty)
             (make-node 5454 "jane" empty empty)) 
  (list (list 1111 "tom") (list 5454 "jane") (list 3434 "joe"))) false)

