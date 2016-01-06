;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l6q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))

;; Lab 6, Question 4

(define (switch-case str)
  (cond [(empty? (string->list str)) empty]
        [(empty? (rest (string->list str))) (cond [(char-lower-case? (first (string->list str))) 
                                                   (char-upcase (first (string->list str)))]
                                                  [(char-upper-case? (first (string->list str))) 
                                                   (list->string (cons (char-downcase (first (string->list str))) empty))])]
        [(char-lower-case? (first (string->list str))) 
                           (list->string (cons (char-upcase (first (string->list str))) (cons (switch-case (substring str 1)))))]
        [(char-upper-case? (first (string->list str))) 
                           (list->string (cons (char-downcase (first (string->list str))) (cons (switch-case (substring str 1)))))]))
  

;;unfinished

(switch-case "GoAt")