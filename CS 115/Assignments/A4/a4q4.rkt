;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*********************************************************
;; CS 115 Assignment 4, Question 4
;;
;; Christopher Alert
;;
;;(Creating a list of strings from an existing list whose 
;; members were at least of average length)
;;
;;*********************************************************

;; Assignment4, Question 4

;;Defined Constants
(define l0 (cons "" (cons ""(cons "" empty))))
(define l1 (cons "one" (cons "four"(cons "fives" empty))))
(define l2 (cons "short" (cons "longer" (cons "longest" empty))))
(define lp (cons "blah" empty))


;;total-str-length: (listof str)-> num [>= 0]
;; Consumes a list of strings, los, and produces the sum of the lengths
;; of the strings
;;Example:(total-str-length empty)=> 0
;;(total-str-length (cons "one" (cons "four"(cons "fives" empty))))=>12
;;(total-str-length empty)=>0
;; (total-str-length (cons "blah" empty))=>4
(define (total-str-length los)
  (cond [(empty? los) 0]
        [(empty? (rest los)) (string-length (first los))]
        [else (+ (string-length (first los)) 
                 (total-str-length (rest los)))]))
;;Tests:
(check-expect (total-str-length empty) 0)
(check-expect (total-str-length l0) 0)
(check-expect (total-str-length l1) 12)

;;avg-str-length: (listof str)-> num[>= 0]
;;consumes a list of strings, los, and produces the average length 
;; of the strings
;;Examples: 
;;(avg-str-length (cons "" (cons ""(cons "" empty))))=> 0
;;(avg-str-length (cons "bellow" (cons "float"(cons "jealous" empty))))=>6
(define (avg-str-length los)
  (/ (total-str-length los) (length los)))
;;Tests:
(check-expect (avg-str-length l1) 4)
(check-expect (avg-str-length l0) 0)

;;long-strings?: (listof str) num[>= 0] -> (listof str)
;;Consumes a list of strings , los, and a number [which would be the 
;; average string length for the question's purposes] and produces a
;;list of the strings which are longer than the average string length.
;;Examples:
;;(cons "blah" empty) (avg-str-length (cons "blah" empty)))
;; =>(cons "blah" empty)
;; (long-strings? (cons "short" (cons "longer" (cons "longest" empty))) 6) 
;; => (cons "longer" (cons "longest" empty))
;;(long-strings? empty)=>empty
(define (long-strings? los benchmark)
  (cond [(empty? los) empty]
        [(>= (length (string->list (first los))) benchmark) 
         (cons (first los) (long-strings? (rest los) benchmark))]
        [else (long-strings? (rest los) benchmark)]))
;;Tests:
(check-expect 
 (long-strings? lp (avg-str-length lp))
 (cons "blah" empty))
(check-expect 
 (long-strings? l2 (avg-str-length l2)) 
 (cons "longer" (cons "longest" empty)))
(check-expect 
 (long-strings? (cons "short" (cons "longer" (cons "longest" empty))) 6) 
 (cons "longer" (cons "longest" empty)))
(check-expect (long-strings? l0 0)
              (cons "" (cons ""(cons "" empty))))

;;long-strings: (listof str)-> (listof str)
;;consumes a list of strings,los, and creates a new list containing only
;;the strings whose length is more than  the average string length of 
;;the list.
;;Example:
;;(long-strings (cons "blah" empty))=>(cons "blah" empty))
;;(long-strings (cons "short" (cons "longer" (cons "longest" empty))))
;;=> (cons "longer" (cons "longest" empty)))
;;(long-strings empty)=>empty
;; (long-strings (cons "blah" empty))=> (cons "blah" empty)
(define (long-strings los)
  (cond
    [(empty? los) empty]
    [(empty? (rest los)) los]
    [else (long-strings? los (avg-str-length los))]))
;;Tests:
(check-expect (long-strings l2) (cons "longer" (cons "longest" empty)))
(check-expect (long-strings l1) (cons "four"(cons "fives" empty))) 
(check-expect (long-strings lp) (cons "blah" empty))
(check-expect (long-strings empty) empty)
(check-expect (long-strings l0) (cons "" (cons ""(cons "" empty))))
