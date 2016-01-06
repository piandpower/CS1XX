;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l2q6) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 Lab 2, Question 1
;; Christopher Alert
;;
;; (Making babies)
;;
;;********************************************





(define myph
  (create-ph 'blue 90 'x 'green 'x 'blue 'oh 'red))

(draw-ph myph)

(define oph
  (create-ph 'pink 80 'lashes 'yellow 'lashes 'yellow 'tooth 'green))

(define (onehalf nbr) (quotient nbr 2))

(define (child mom dad)
  (create-ph (what-head-colour dad)
             (onehalf(what-head-size mom))
             (what-r-eye-type mom)
             (what-r-eye-colour dad)
             (what-l-eye-type mom)
             (what-l-eye-colour dad)
             (what-mouth-type mom)
             (what-mouth-colour dad)))
(draw-ph oph)

(draw-ph (child oph myph))

(draw-ph (child myph oph))