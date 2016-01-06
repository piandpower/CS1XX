;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname untitled) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))

 ;; Lab 6, Question 2

(define (count-even-strings alist)
  (cond [(empty? alist) 0]
        [(equal? (remainder (string-length (first alist)) 2) 0) (+ 1(count-even-strings (rest alist)))]
        [else (+ 0 (count-even-strings (rest alist)))]))

;;Tests:
(check-expect (count-even-strings (cons "al"(cons "ert"(cons "chri"(cons "fives" empty)))))2) 

        
        
       