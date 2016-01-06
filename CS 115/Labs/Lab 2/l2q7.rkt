;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l2q7) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 Lab 2, Question 1
;; Christopher Alert
;;
;; (Open ended)
;;
;;********************************************


(define myph
  (create-ph 'blue 90 'x 'green 'x 'blue 'oh 'red))

(define oph
  (create-ph 'pink 80 'lashes 'yellow 'lashes 'yellow 'tooth 'green))

(define (nigga blk whte)
  (create-ph 'black 153
             (what-l-eye-type blk)
             'black
             (what-r-eye-type whte)
             'black
             (what-mouth-type blk)
             'black))
(draw-ph (nigga oph myph))
(draw-ph (nigga myph oph))