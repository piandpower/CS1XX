;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |working a8q1|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
(define-struct t-node (label children))
;; A general tree (gen-tree) is either a string or a structure
;; (make-t-node l c), where l is a string and c is a tree-list.
;; A tree-list is either (cons t empty) or (cons t tlist) where 
;; t is a gen-tree and tlist is a tree-list.

;; Question 1
;(define (height g) 
 ; ... )

(define (height-tree g)
  (cond
    [(string? g) 0]
    [(t-node? g) (+ 1 (max-of-list (height-list (t-node-children g))))]
    ))


(define (height-list c)
        (cond 
          [(empty? c) empty]
          [(string? (first c)) (cons 0 (height-list (rest c)))]
          [(t-node? (first c)) (cons (height-tree (first c)) (height-list (rest c)))]))

(define (max-of-list lst)
  (cond
    [(empty? lst) 0]
    [(empty? (rest lst)) (first lst)]
    [else 
     (max (first lst)
          (max-of-list (rest lst)))]))



(define mytree (make-t-node "a"
(list "b" (make-t-node "c"
(list "e" (make-t-node "f"
(list "h" "i" "j"))))
(make-t-node "d" (list "g")))))

(height-list (t-node-children mytree))