;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l4q6) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))


;; Lab 4, Question 6

(define (connect? string1 string2)
  (cond
    [(string=? (substring (- (string-length string1) 1))
               (substring (- (string-length string2) 1))) true]
    [else false]
    ))
  