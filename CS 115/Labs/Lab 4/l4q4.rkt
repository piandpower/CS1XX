;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l4q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))

;; Lab 4, Question 4

(define (wink aph side)
  (cond
    [(symbol=? 'left) (new-l-eye-type aph 'line)]
    [(symbol=? 'right) (new-r-eye-type aph 'line)]))
    
  ;;(check-expect (ph	? (wink onepotato ’left) leftwinkone) true)
       
  ...)