;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a6q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*************************************************************
;; CS 115 Assignment 6, Question 2
;; Christopher Alert
;;
;;(Creating a list of strings utilizing the two input numbers)
;; 
;;
;;**************************************************************


;; Question 2

;;Defined Constants:
(define result (list "444" "55" "6" ""))
(define result2 (list "0000" "111" "22" "3" ""))
(define result3 (list "5" ""))
(define result4 (list ""))
(define result5 (list "111111" "1212" "13" ""))

;;stringapp: nat nat-> string
;;Consumes two natural numbers n,d and produces a string,
;; with n copies of d
;;Examples:
;;(stringapp 4 0)=> "0000"
;;(stringapp 1 5)=> "5"
;;(stringapp 0 45)=> ""
;;(stringapp 3 11)=> "111111"
(define (stringapp n d)
  (cond [(= 0 n) ""]
        [else (string-append (number->string d) 
                             (stringapp (sub1 n) d))]))
;;Tests:
(check-expect (stringapp 4 0) "0000")
(check-expect (stringapp 1 5) "5")
(check-expect (stringapp 0 1345) "")
(check-expect (stringapp 3 11) "111111")

;;make-digit-list: nat nat> (listof string)
;;Consumes two natural numbers n,d and produces a list ofstrings,
;; beginning with n copies of d, then n-1 copies of d+1 and so on
;; until no no copies of n, that is, the empty string. 
(define (make-digit-list n d)
  (cond [(= 0 n) (cons "" empty)]
        [else (cons (stringapp n d) 
                    (make-digit-list (sub1 n) (add1 d)))]))
;;Tests:
(check-expect (make-digit-list 5 3)
              (cons "33333" 
                    (cons "4444" 
                          (cons "555" 
                                (cons "66" 
                                      (cons "7" 
                                            (cons "" empty)
                                            ))))))
(check-expect(make-digit-list 4 11)
             (cons "11111111"(cons "121212" 
                                   (cons "1313"
                                         (cons "14" 
                                               (cons "" empty)
                                               )))))
;;Tests:
(check-expect (make-digit-list 0 11) (cons "" empty))
(check-expect (make-digit-list 3 4) result)
(check-expect (make-digit-list 4 0) result2)
(check-expect (make-digit-list 1 5) result3)
(check-expect (make-digit-list 0 1345) result4)
(check-expect (make-digit-list 3 11) result5)

