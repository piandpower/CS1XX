;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a0q1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 Lab 2, Question 1
;; Christopher Alert
;;
;; (Creating and displaying myph)
;;
;;********************************************

(define myph
  (create-ph 'blue 50 'x 'green 'lashes 'blue 'oh 'red))

(draw-ph myph)

(define newph
  (create-ph 'black 50 'x 'green 'x 'green 'oh 'red))

(draw-ph newph)