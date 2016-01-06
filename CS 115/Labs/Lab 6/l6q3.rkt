;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l6q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Lab 6, Question 3

(define (list-pos alist item)
  (cond [(empty? (rest alist)) 0]
        [else (+ 1 (list-pos (rest alist) item))]))

;Tests:
(check-expect (list-pos (cons 2(cons 7(cons 8(cons "cheese" empty)))) "cheese")3)
(check-expect (list-pos (cons 2 empty)2)0)
  
