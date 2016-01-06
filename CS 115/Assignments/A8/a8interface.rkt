;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a8interface) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
(define-struct t-node (label children))
;; A general tree (gen-tree) is either a string or a structure
;; (make-t-node l c), where l is a string and c is a tree-list.
;; A tree-list is either (cons t empty) or (cons t tlist) where 
;; t is a gen-tree and tlist is a tree-list.

;; A leaf-labelled tree (llt) is one of the following:
;; empty
;; (cons l1 l2) where l1 is a non-empty llt and l2 is a llt
;; (cons v l) where v is an integer and l is a llt

(define-struct ae (fn args))
;; An arithmetic expression (aexp) is either a number, or a
;; structure (make-ae f alist) where f is a symbol and alist is
;; an aexplist.
;;
;; An aexplist is either empty or (cons a alist) where a is an
;; aexp and alist is an aexplist.

;; Question 1
(define (height g) 
  ... )

;; Question 2
(define (is-organic? c) 
  ... )

;; Question 3
(define (double-odds allt) 
  ... )

;; Question 4
(define (num-0-results ex) 
  ... )
