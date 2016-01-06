;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a8q1) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 8, Question 1                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the height of a general tree)              ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;

;; Question 1

(define-struct t-node (label children))
;; A general tree (gen-tree) is either a string or a structure
;; (make-t-node l c), where l is a string and c is a tree-list.
;; A tree-list is either (cons t empty) or (cons t tlist) where 
;; t is a gen-tree and tlist is a tree-list.

;;Defined Constants:
(define
  mytree 
  (make-t-node 
   "a"
   (list "b" 
         (make-t-node
          "c"
          (list "e" 
                (make-t-node "f"
                             (list "h" "i" "j"))))
         (make-t-node "d" (list "g")))))
(define
  tree2 
  (make-t-node 
   "a"
   (list "b" 
         (make-t-node
          "x"
          (list "k" "y" "b"))
         (make-t-node "c"
                      (list "e" 
                            (make-t-node
                             "f"
                             (list "y" "z" 
                                   (make-t-node "e"
                                                (list "s" "p" "q"))))))
         (make-t-node "d" (list "g" 
                                (make-t-node "j"
                                             (list "s" "t" "f")))))))
(define
  tree3 
  (make-t-node
   "a"
   (list 
    (make-t-node "x"
                 (list "k" "y" "b"))
    (make-t-node "c"
                 (list (make-t-node "f"
                                    (list "y" "z" 
                                          (make-t-node "e"
                                                       (list "s" "p" "q"))))
                       "T"))
    (make-t-node "d" (list "g" 
                           (make-t-node "j"
                                        (list "s" "t" "f")))))))
(define myhlist (list 0 2 1))
(define hlist2 (list 0 1 3 2))
(define hlist3 (list 1 3 2))

;;height-list: tree-list-> (list-of nat)
;;Consumes a gen-tree c and produces a list of the heights of its 
;;branches
;;Examples:
;;(height-list (t-node-children tree2))=> (list 0 1 3 2)
;;(height-list (t-node-children mytree))=> (list 0 2 1)
;;(height-list empty)=> empty
;;(height-list "R")=> 0
(define (height-list c)
  (cond 
    [(empty? c) empty]
    [(string? c) 0]
    [(string? (first c)) (cons 0 (height-list (rest c)))]
    [(t-node? (first c)) (cons (height (first c)) (height-list (rest c)))]))
;;Tests:
(check-expect (height-list (t-node-children tree2)) (list 0 1 3 2))
(check-expect (height-list (t-node-children mytree)) (list 0 2 1))
(check-expect (height-list empty) empty)
(check-expect (height-list "R") 0)
(check-expect (height-list (t-node-children tree3)) (list 1 3 2))

;;max-of-list: (listof nat)-> nat
;;Consumes a list of natural numbers lst and produces the highest number
;;Examples:
;;(max-of-list empty)=> 0
;;(max-of-list myhlist)=> 2
;;(max-of-list (list 0))=> 0
(define (max-of-list lst)
  (cond
    [(empty? lst) 0]
    [(empty? (rest lst)) (first lst)]
    [else 
     (max (first lst)
          (max-of-list (rest lst)))]))
;;Tests:
(check-expect (max-of-list empty) 0)
(check-expect (max-of-list myhlist) 2)
(check-expect (max-of-list hlist2) 3)
(check-expect (max-of-list hlist3) 3)
(check-expect (max-of-list (list 0)) 0)


;;height: gen-tree-> nat
;;Consumes a gen-tree g and produces its height.
;;Examples:
;;(height mytree)=> 3
;;(height tree2)=> 4
;;(height tree3)=> 4
;;(height empty)=> 0
(define (height g) 
  (cond
    [(string? g) 0]
    [(t-node? g) (+ 1 (max-of-list (height-list (t-node-children g))))]
    ))
;;Tests:
(check-expect (height mytree) 3)
(check-expect (height tree2) 4)
(check-expect (height tree3) 4)
(check-expect (height "T") 0)
