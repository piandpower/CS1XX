;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a8q4) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 8, Question 4                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Counting the number of time zero is the result of an   ;;
;; addition or multiplication)                            ;;
;;                                                        ;;
;;********************************************************;;


;; Question 4

(define-struct ae (fn args))
;; An arithmetic expression (aexp) is either a number, or a
;; structure (make-ae f alist) where f is a symbol and alist is
;; an aexplist.
;;
;; An aexplist is either empty or (cons a alist) where a is an
;; aexp and alist is an aexplist.


;;Defined Constants
(define myex1 (make-ae '+ (list 0 2 -2 3 1 -4 0)))
(define myex2 (make-ae '* (list 3 0 2 7)))
(define myex3 (make-ae '* (list myex1 3 0 2 7)))

;;eval-zeros: aexp-> (list of num nat[>= 0])
;;Consumes an aexp, ex, and produces a list with the result of the aexp
;; and the number of times 0 is a result of a multiplication or addition.
;;Examples:
;;(eval-zeros (make-ae '+ empty))=> (list 0 0)
;;(eval-zeros myex1)=> (list 0 4)
;;(eval-zeros myex2)=> (list 0 2)
;;(eval-zeros myex3)=> (list 0 7)
(define (eval-zeros ex)                                               
  (cond                                                                
    [(number? ex) (list ex 0)]     
    [else                                                                  
     (count-apply (ae-fn ex) (ae-args ex))]))                         
;;Tests:
(check-expect (eval-zeros (make-ae '+ empty)) (list 0 0))
(check-expect (eval-zeros myex1) (list 0 4))
(check-expect (eval-zeros myex2) (list 0 2))
(check-expect (eval-zeros myex3) (list 0 7))

;;count-apply: symbol aexplist-> (list of num nat[>= 0])
;;Consumes a symbol, f, and an aexplist, exlist and produces a list with
;; the result of applying the operation to the members of the aexplist and
;; the count of the number of times 0 is the result.
;;Examples:
;;(count-apply '+ (ae-args myex1))=> (list 0 4)
;;(count-apply '* (ae-args myex2))=> (list 0 2)
;;(count-apply '* (ae-args myex3))=> (list 0 7)
;;(count-apply '+ (list 0))=> (list 0 1)
;;(count-apply '+ empty)=> (list 0 0)
(define (count-apply f exlist)              
  (cond                                       
    [(empty? exlist)                           
     (cond [(symbol=? f '*) (list 1 0)]     
           [(symbol=? f '+) (list 0 0)])]                
    [(cons? exlist)                    
     (cond                                   
       [(symbol=? f '*)                  
        (count-0 '* (eval-zeros (first exlist))
                 (count-apply f (rest exlist)))]       
       [(symbol=? f '+)
        (count-0 '+ (eval-zeros (first exlist))
                 (count-apply f (rest exlist)))])]))    
;;Tests:
(check-expect (count-apply '+ (ae-args myex1)) (list 0 4))  
(check-expect (count-apply '* (ae-args myex2)) (list 0 2))  
(check-expect (count-apply '* (ae-args myex3)) (list 0 7))
(check-expect (count-apply '+ (list 0)) (list 0 1))
(check-expect (count-apply '+ empty) (list 0 0))

;;count-0: symbol (listof num nat) (listof num nat)-> (listof num nat)
;;Consumes lists representing the results of evaluated aexpressions,result1
;; and result2 and produces a list with first the value of evaluating the 
;;first of both lists with the relevant operation and second the number of
;;times zero was the result of the expression.
;;Examples:
;;(count-0 '+ (list 0 4) (list 7 12))=> (list 7 16)
;;(count-0 '+ (list 0 0) (list 0 0))=> (list 0 1)
;;(count-0 '* (list 0 4) (list 7 12))=> (list 0 17)
;;(count-0 '* (list 4 0) (list 0 1))=> (list 0 2)
(define (count-0 operation result1 result2)
  (cond
    [(symbol=? '+ operation)
     (cond
       [(zero? (+ (first result1) (first result2))) 
        (list (+ (first result1) (first result2)) 
              (+ 1 (second result1) (second result2)))]
       [else (list (+ (first result1) (first result2)) 
                   (+ (second result1) (second result2)))])]
    [(symbol=? '* operation)
     (cond
       [(or (zero? (first result1)) (zero? (first result2))) 
        (list (* (first result1) (first result2)) 
              (+ 1 (second result1) (second result2)))]
       [else (list (* (first result1) (first result2)) 
                   (+ (second result1) (second result2)))])]))
;;Tests:
(check-expect (count-0 '+ (list 0 4) (list 7 12)) (list 7 16))
(check-expect (count-0 '+ (list 0 0) (list 0 0)) (list 0 1))
(check-expect (count-0 '* (list 0 4) (list 7 12)) (list 0 17))
(check-expect (count-0 '* (list 4 0) (list 0 1)) (list 0 2))

;;num-0-results: aexp-> nat
;;Consumes an aexp, ex and produces the number of times 0 is a result of
;;applying addition or multiplication to the aexplist of the aexp.
;;Examples:
;;(num-0-results myex1) 4
;;(num-0-results myex2) 2
;;(num-0-results myex3) 7
;;(num-0-results 0)=> 0
;;(num-0-results (make-ae '+ (list 0)))=> 1
;;(num-0-results (make-ae '+ empty))=> 0
(define (num-0-results ex)
  (second (eval-zeros ex)))
;;Tests:
(check-expect (num-0-results myex1) 4)  
(check-expect (num-0-results myex2) 2)  
(check-expect (num-0-results myex3) 7)
(check-expect (num-0-results 0) 0)
(check-expect (num-0-results (make-ae '+ (list 0))) 1)
(check-expect (num-0-results (make-ae '+ empty)) 0)
