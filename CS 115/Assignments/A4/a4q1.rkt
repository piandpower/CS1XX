;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*********************************************************
;; CS 115 Assignment 4, Question 1
;; Christopher Alert
;;
;;(Making the string of the reciprocal values of an existing
;; string)
;;
;;*********************************************************
;; Assignment 4, Question 1



;;Constants
(define placebo (cons "jackpot" (cons 0 (cons 'Infinity empty))))
(define t1 (cons 0 empty))
(define t2 (cons 'Infinity empty))
(define t3 (cons 6 empty))
(define t4 (cons 'blue empty))
(define t-ugly 
  (cons 2 (cons "eggs" 
                (cons 4 (cons 5 (cons (/ 1 7) 
                                      (cons 9 empty)))))))

;; reciprocate: (listof any)-> (listof (union num symbol)
;; Consumes the list of any values alist and produces the reciprocal
;;value of the members of the list "alist" provided that they are
;;numbers or symbol 'Infinity [which is the reciprocal of 0].
;;Example: (reciprocate (cons 2(cons 5 empty)))=> (cons 0.5 (cons 0.2 empty))
;;(reciprocate (cons 0(cons 'Infinity empty)))=> (cons 'Infinity (cons 0 empty))
;;(reciprocate (cons "bleh" empty))=> empty
;;(reciprocate? empty)=>empty
(define (reciprocate alist)
  (cond
    [(empty? alist) empty]
    [(or (number? (first alist)) (symbol? (first alist))) 
     (cond [(and (symbol? (first alist)) (symbol=? 'Infinity (first alist))) (cons 0 (reciprocate (rest alist)))]           
           [(equal? 0 (first alist)) (cons 'Infinity (reciprocate (rest alist)))]           
           [(number? (first alist)) (cons (/ 1 (first alist)) (reciprocate (rest alist)))]
           [else (reciprocate (rest alist))])]      
    [else (reciprocate (rest alist))]))
;;Tests
(check-expect (reciprocate placebo) (cons 'Infinity (cons 0 empty)))
(check-expect (reciprocate empty) empty)
(check-expect (reciprocate t1) (cons 'Infinity empty))
(check-expect (reciprocate t2) (cons 0 empty))
(check-expect (reciprocate t3) (cons (/ 1 6) empty))
(check-expect (reciprocate t3) (cons (/ 1 6) empty))
(check-expect (reciprocate t4) empty)
(check-expect (reciprocate t-ugly) 
              (cons (/ 1 2) (cons (/ 1 4) (cons (/ 1 5) (cons 7 (cons (/ 1 9) empty))))))

