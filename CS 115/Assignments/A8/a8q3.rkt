;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a8q3) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 8, Question 3                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Doubling any occurences of odd numbers in a leaf       ;;
;;labelled tree                                           ;;
;;                                                        ;;
;;********************************************************;;

;; Question 3

;; A leaf-labelled tree (llt) is one of the following:
;; empty
;; (cons l1 l2) where l1 is a non-empty llt and l2 is a llt
;; (cons v l) where v is an integer and l is a llt


;;odd-fun: (listof num)-> (listof num)
;;Consumes a listof numbers lst and produces the list with any odd numbers
;;multiplied by two.
;;Examples:
;;(odd-fun empty)=> empty
;;(odd-fun '(2 1))=>(list 2 2)
;;(odd-fun '((4 2) 3 (4 1 6))) '((4 2) 6 (4 2 6))
;;(odd-fun '(2)) '(2)
;;(odd-fun '(1)) '(2)
(define (odd-fun lst)
  (cond
    [(empty? lst) empty]
    [(and (number? (first lst)) (even? (first lst)))
     (cons (first lst)
           (odd-fun (rest lst)))]
    [(and (number? (first lst)) (odd? (first lst))) (cons (* 2 (first lst))
                                                          (odd-fun (rest lst)))]
    [(cons? (first lst)) (cons (double-odds (first lst))
                               (odd-fun (rest lst)))]))
;;Tests:
(check-expect (odd-fun empty) empty)
(check-expect (odd-fun '(2 1)) '(2 2))
(check-expect (odd-fun '((4 2) 3 (4 1 6))) '((4 2) 6 (4 2 6)))
(check-expect (odd-fun '(1)) '(2))
(check-expect (odd-fun '(2)) '(2))



;;double-odds: llt-> llt
;;Consumes a llt, allt and produces a copy of the original llt with any
;;occurences of odd numbers replaced by twice the odd number.
;;Examples:
;;(double-odds empty) empty
;;(double-odds '(2 1))=> '(2 2)
;;(double-odds '((4 2) 3 (4 1 6)))=> '((4 2) 6 (4 2 6))
;;(double-odds '(1))=> '(2)
(define (double-odds allt) 
  (cond
    [(empty? allt) empty]
    [(and (cons? allt) (not (number? (first allt))))
     (cons (odd-fun (first allt))
           (odd-fun (rest allt)))]
    [else (odd-fun allt)]
    ))
;;Tests:
(check-expect (double-odds empty) empty)
(check-expect (double-odds '(2 1)) '(2 2))
(check-expect (double-odds '((4 2) 3 (4 1 6))) '((4 2) 6 (4 2 6)))
(check-expect (double-odds '(1)) '(2))
(check-expect (double-odds '(2)) '(2))
