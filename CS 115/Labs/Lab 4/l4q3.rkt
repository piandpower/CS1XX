;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l4q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Lab 4, Question 3

(define (eyes-match? aph)
  (cond
    [(and (symbol=? (what-l-eye-type aph) (what-r-eye-type aph))
         (symbol=? (what-l-eye-colour aph) (what-r-eye-colour aph))) true]
    [else false]))
