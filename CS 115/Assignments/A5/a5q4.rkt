;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a5q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 5, Question 4
;; Christopher Alert
;;
;;(Calculating the amount of money left on Chuckie Lucky's
;; bank account or if he has overdrawn)
;;
;;*********************************************************

;; Assignment 5, Question 4

;;Constants
(define P 1000000)
(define r .08)
(define W 100000)


;;compounded-P: num num-> num
;;Consumes P which represents the principal sum on the account
;;on which interest is compounded and years, which is the
;;remaining number of years that the closing balance will be 
;;evaluated for and produces the balance on the account after
;;withdrawals for the year.
;;Examples: 
;;(compounded-P P 0)=> 1000000
;;(compounded-P P 2)=> 958400
;;(compounded-P P 21)=> -8458.43
(define (compounded-P P years)
  (cond [(zero? years) P]
        [else (compounded-P (- (+ P (* r P)) W) (sub1 years))]))
;;Tests:
(check-expect (compounded-P P 0) 1000000)
(check-expect (compounded-P P 2) 958400)
(check-within (compounded-P P 20) .0001 84760.7140)

;;balance: nat -> num
;;Consumes a natural number , n-years, and produces the balance
;;on Chuckie Lucky's account after the number of years specified
;; or produces the symbol 'Overdrawn othserwise.
;;Examples:
;;(balance 0)=> 1000000
;;(balance 2)=> 958400
;;(balance 21)=> 'Overdrawn
(define (balance n-years)
  (cond [(< (compounded-P P n-years) 0) 'Overdrawn]
        [else (compounded-P P n-years)]))
;;Tests:
(check-expect (balance 0)1000000)
(check-expect (balance 10) 710268.75068180332544)
(check-expect (balance 21) 'Overdrawn)