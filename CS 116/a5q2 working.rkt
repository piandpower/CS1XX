;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |a5q2 working|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct node (value next))
;; A node is a structure (make-node v n) where
;;   v is an integer, and
;;   n is either a node or the symbol 'end

(define a-linked-list (make-node 3 (make-node 17 (make-node -1 (make-node 22 'end)))))

a-linked-list

(define (node-value-list n acc-lst)
         (cond
           [(equal? 'end n) acc-lst]
           [else (node-value-list (node-next n)
                                  (append acc-lst
                                          (list (node-value n))))]))
      (node-value-list a-linked-list empty)
      
      ;  (local
;    [(define (call-on-all f n)
;       (cond
;         [(equal? 'end n) empty]
;         [else (cons (f n) (call-on-all f (node-next n)))]))]
;    (call-on-all node-value a-linked-list))))