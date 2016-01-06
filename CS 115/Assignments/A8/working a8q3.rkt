;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |working a8q3|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;; A leaf-labelled tree (llt) is one of the following:
;; empty
;; (cons l1 l2) where l1 is a non-empty llt and l2 is a llt
;; (cons v l) where v is an integer and l is a llt


;; Question 3
;(define (double-odds allt) 
; ... )


(define (double-fn allt)
  (cond
    [(empty? allt) empty]
    [(and (cons? allt) (not (number? (first allt))))
     (cons (odd-fun (first allt))
           (odd-fun (rest allt)))]
    [else (odd-fun allt)]
    ))
;;                                       

(define (odd-fun lst)
  (cond
    [(empty? lst) empty]
    [(and (number? (first lst)) (even? (first lst))) (cons (first lst)
                                                           (odd-fun (rest lst)))]
    [(and (number? (first lst)) (odd? (first lst))) (cons (* 2 (first lst))
                                                          (odd-fun (rest lst)))]
    [(cons? (first lst)) (cons (double-fn (first lst))
                               (odd-fun (rest lst)))]))

(double-fn '(2 1))
(double-fn '((4 2) 3 (4 1 6)))
