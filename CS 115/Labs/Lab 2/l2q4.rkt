;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l2q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 Lab 2, Question 1
;; Christopher Alert
;;
;; (Making sleep function)
;;
;;********************************************





(define myph
  (create-ph 'blue 50 'x 'green 'x 'blue 'oh 'red))

(draw-ph myph)


(define (sleep aph)
  (create-ph (what-head-colour aph)
             (what-head-size aph)          
             'line 
             (what-l-eye-colour aph)
             'line
             (what-r-eye-colour aph)
             'line
             (what-mouth-colour aph)))

(draw-ph(sleep myph))