;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname labinterface11) (read-case-sensitive #t) (teachpacks ((lib "compound.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.ss" "installed-teachpacks")))))
(define-struct t-node (label children))
;; A general tree (gen-tree) is either
;;      a string or
;;      a structure (make-t-node l c), where
;;           l is a string and
;;           c is a tree-list.

;; A tree-list is either
;;      empty or
;;      (cons t tlist), where
;;           t is a gen-tree and
;;           tlist is a tree-list.

;; Lab 11, Question 2

(define-struct aevx (fn args))

(define (evalx avx xval)
  ...)

;; Lab 11, Question 3

(define (llt-count info l)
  ...)

;; Lab 11, Question 4

(define (from-country? s-prdt origin)
  ...)

;; Lab 11, Question 5 

(define (molar-mass cmpd)
  ...)
