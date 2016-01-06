;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a2q5) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 2, Question 5                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the elements which give the smallest result;;
;; when one function is called on different values)       ;;
;;                                                        ;;
;;********************************************************;;
;;



;; Question 5
;; select-min: (X->num) (listof X) (listof X) (listof X)-> num`
;; Consumes a function,f, and three lists,A,B,C of equal length and
;; the same type and produces the value with the smallesr result at
;; each positon when f is evaluated for each value at that position.
;;Example:
;; (select-min string-length (list "hi" "there" "friend" "a-z")
;;                          (list "two"	"times"	"three" "123")
;;                          (list "about" "nothing" "" "!!!"))
;;              =>(list "hi" "there" "" "a-z")
;; (select-min (lambda (x) (/ 1 x)) (list -9 4 7 8)
;;                          (list 32 15 3 2)
;;                          (list 70 4 5 6))
;;              =>(list -9 15 7 8)
;; (select-min sqr (list -9 4 7 0)
;;                          (list 32 15 3 6)
;;                          (list 70 4 5 6))
;;              =>(list -9 4 3 0))
;; (select-min add1 (list 1) (list 2) (list 3))
;;              =>(list 1)
(define (select-min f A B C)
  (cond
    [(empty? A) empty]
    [(equal? (first (map f A)) (first (map min (map f A) (map f B) (map f C))))
     (cons (first A) (select-min f (rest A) (rest B) (rest C)))]
    [(equal? (first (map f B)) (first (map min (map f A) (map f B) (map f C))))
     (cons (first B) (select-min f (rest A) (rest B) (rest C)))]
    [else (cons (first C) (select-min f (rest A) (rest B) (rest C)))]))
;;Tests:
(check-expect (select-min add1 (list 1) (list 2) (list 3))
              (list 1))
(check-expect (select-min sub1 (list 1) (list 1) (list 1))
              (list 1))
(check-expect (select-min sqr (list -9 4 7 0)
                          (list 32 15 3 6)
                          (list 70 4 5 6))
              (list -9 4 3 0))
(check-expect (select-min (lambda (x) (/ 1 x)) (list -9 4 7 8)
                          (list 32 15 3 2)
                          (list 70 4 5 6))
              (list -9 15 7 8))
(check-expect (select-min string-length (list "hi" "there" "friend" "a-z")
                          (list "two"	"times"	"three" "123")
                          (list "about" "nothing" "" "!!!"))
              (list "hi" "there" "" "a-z"))
(check-expect (select-min string-length empty empty empty) empty)
