;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab11q1) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
(define-struct t-node (label children))
;; A general tree (gen-tree) is either
;;      a string or
;;      a structure (make-t-node l c), where
;;           l is a string and
;;           c is a tree-list.

(define (node-count gen-tree)
  (local
    [(define (node-counter g-tree)
       (+ 1 (list-count (t-node children))))
     (define (list-count lot)
       (cond
         [(empty? lot) 0]
         [(string? (first lot)) 
          (+ 1 (list-count (rest lot)))]
         [(t-node? (first lot)) (+ (node-counter (first lot))
                                   (list-count (rest lot)))]))];either str or 
         (cond
           [(string? gen-tree) 1]
           [else (node-counter gen-tree)])))