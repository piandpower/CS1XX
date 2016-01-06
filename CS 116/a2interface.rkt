;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a2interface) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;; Lost-Cities-Card structure ...
(define-struct Lost-Cities-Card (value colour))
;; A Lost-Cities-Card is a structure (make-Lost-Cities-Card v c), where
;; v is the symbol 'multiply or an integer in the range [2:10]
;; c is a symbol for the colour of the card (one of 'red, 'blue, 'white, 'yellow, 'green)

;; Question 1:
(define (count-multiply-cards hand)
  ...)

;; Question 2: 
(define (score-Lost-Cities column)
  ...)

;; Question 3:
(define (build-deck-to top-value)
  ...)

;; Question 4:
(define (playable-cards top-card)
  ...)

;; Question 5
(define (select-min f A B C)
  ...)