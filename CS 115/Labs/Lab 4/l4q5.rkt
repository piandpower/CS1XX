;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l4q5) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))

;; Lab 4, Question 5

(define (switch-case-char achar)
  (cond
    [(char-alphabetic? achar) (cond
                               [(char-lower-case? achar) (char-upcase achar)] 
                               [(char-upper-case? achar) (char-downcase achar)])]
    [else achar]))
                               
 
    
