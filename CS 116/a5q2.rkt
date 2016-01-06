;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a5q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
;;
;;********************************************************;;
;; CS 116 Assignment 5, Question 2                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Performing different mutations on a node structure)    ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;

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

;; a-linked-list: node
;; initial value
(define a-linked-list (make-node 3 (make-node 17 (make-node -1 (make-node 22 'end)))))

;; a-node: node
;; initial value
(define a-node (make-node 99 'end))

;; (Part A)

;; add-a-node: (listof int)
;; Purpose: This function produces a list of integers.
;; Effects: 
;; The function changes the value of a-linked-list to a node
;; with third value (node-value a-node), followed by the rest of
;; the original list, changes the value of a-node to 'end and
;; produces the list of the values of the new a-linked-list in
;; the order they appear.
;; Examples:
;;
;; where a-linked-list is 
;; (make-node 3 (make-node 17 (make-node -1 (make-node 22 'end)))),
;; and a-node is (make-node 99 'end), calling the function (add-a-node),
;; produces (list 3 17 99 -1 22) and a-linked-list is
;; (make-node 3 (make-node 17 (make-node 99 (make-node -1 (make-node 22 'end)))))
;; and a-node is 'end.
(define (add-a-node)
  (begin
    (set-node-next! a-node (node-next (node-next a-linked-list)))
    (set-node-next! (node-next a-linked-list)
                    a-node)
    (set! a-node 'end)
    (local
      [(define (node-value-list n acc-lst)
         (cond
           [(equal? 'end n) acc-lst]
           [else (node-value-list (node-next n)
                                  (append acc-lst
                                          (list (node-value n))))]))]
      (node-value-list a-linked-list empty))))
;; Test cases for add-a-node
(check-expect
 (begin
   (equal? (add-a-node)
           (list 3 17 99 -1 22))
   (equal? a-linked-list
           (make-node 3 
                      (make-node 17 
                                 (make-node 99 
                                            (make-node -1
                                                       (make-node 22 'end))))))
   (equal? a-node 'end))
 true)


;; (Part B)

;; remove-second: (listof int)
;; Purpose: This function produces a list of integers.
;; Effects:
;; The function changes the value of a-linked-list to a node
;; with second value the third term in a-node, followed by the rest of the
;; original node following the third and produces the list of the values
;; of the new a-linked-list in the order they appear.
;; Examples:
;;
;; where a-linked-list is 
;; (make-node 3 (make-node 17 (amke-node 99 (make-node -1 (make-node 22 'end)))),
;; and a-node is (make-node 99 'end), calling the function (remove-second),
;; produces (list 3 99 -1 22) and a-linked-list is
;; (make-node 3 (make-node 17 (make-node 99 (make-node -1 (make-node 22 'end)))))
;;
(define (remove-second)
  (cond
    [(equal? 'end (node-next a-linked-list))
     (list (node-value a-linked-list))]
    [else
     (begin
       (set-node-next! a-linked-list 
                       (node-next (node-next a-linked-list)))
       (local
         [(define (node-value-list n acc-lst)
            (cond
              [(equal? 'end n) acc-lst]
              [else (node-value-list (node-next n)
                                     (append acc-lst
                                             (list (node-value n))))]))]
         (node-value-list a-linked-list empty)))]))
;; Test cases for remove-second
(check-expect
 (begin
   (set! a-node (make-node 99 'end))
   (set! a-linked-list
          (make-node 3 (make-node 17 (make-node -1 (make-node 22 'end)))))
   (add-a-node)
   (equal? (remove-second)
           (list 3 99 -1 22))
   (equal? a-linked-list
           (make-node 3  
                      (make-node 99 
                                 (make-node -1
                                            (make-node 22 'end))))))
 true)




;; (Part C)

;; add-second: int -> (listof int)
;; Purpose: This function consumes an integer, n, and  produces a list 
;; of integers of which the second element is n.
;; Effects:
;; The function changes the value of a-linked-list to a node
;; with second value n, followed by the rest of the
;; original node from the first node-next and produces the list of the values
;; of the new a-linked-list in the order they appear.
;; Examples:
;;
;; where a-linked-list is 
;; (make-node 3 (amke-node 99 (make-node -1 (make-node 22 'end)))),
;; and a-node is (make-node 99 'end), calling the function (add-second 12),
;; produces (list 3 12 99 -1 22) and a-linked-list is
;; (make-node 3 (make-node 12 (make-node 99 (make-node -1 (make-node 22 'end)))))
;;
(define (add-second n)
  (begin
    (set-node-next! a-linked-list
                    (make-node n (node-next a-linked-list)))
    (local
      [;; node-value-list: node (listof nat)-> (listof nat)
       ;; consumes a node, n, and produces the lsit of the
       ;; values of the node in order.
       (define (node-value-list n acc-lst)
         (cond
           [(equal? 'end n) acc-lst]
           [else (node-value-list (node-next n)
                                  (append acc-lst
                                          (list (node-value n))))]))]
      (node-value-list a-linked-list empty))))
;; Test cases for add-second:
(check-expect
 (begin
   (set! a-node (make-node 99 'end))
   (set! a-linked-list
          (make-node 3 (make-node 17 (make-node -1 (make-node 22 'end)))))
   (add-a-node)
   (remove-second)
   (and (equal? (add-second 12)
                (list 3 12 99 -1 22))
        (equal? 
         a-linked-list
         (make-node 3
                    (make-node 12
                               (make-node 99 
                                          (make-node -1
                                                     (make-node 22 'end))))))))
 true)


