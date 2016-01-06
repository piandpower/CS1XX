;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a5q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
;;
;;********************************************************;;
;; CS 116 Assignment 5, Question 3                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Mutating a list of words making them loop one by one)  ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Question 3

;; state variable
;; NOTE: We will be changing the initial value of words for auto-testing of this question.
;; Your function should make no assumptions about words except that is a list of 
;; strings and contains at least one string.

;; words: (listof string)
;; initial value 
(define words (list "Lions" "Tigers" "Bears" "Oh, my!"))

;; next-word: string
;; Purpose: This function produces a string.
;; Effects: 
;; The function on its first call produces the first element of a string and
;; on subsequent calls goes through the list,words, producing each value until 
;; the end then it repeats.
;; Examples:
;;
;; where words is (list "Lions" "Tigers" "Bears" "Oh, my!")
;; calling the function (next-word) produces "Lions", calling it again
;; produces "Tigers" , again "Bears", another time "Oh, my!" and again "Lions".
;;
(define (next-word)
  (begin
    (set! words (append (rest words) (list (first words))))
    (list-ref words (sub1 (length words)))))
;(local
;      [(define (last-of-list l)
;         (cond
;           [(empty? (rest l)) (first l)]
;           [else (last-of-list (rest l))]))]
;      (last-of-list words))))
;;Tests:
(check-expect
 (and (equal? (next-word)
              "Lions")
      (equal? (next-word)
              "Tigers")
      (equal? (next-word)
              "Bears")
      (equal? (next-word)
              "Oh, my!")
      (equal? (next-word)
              "Lions"))
 true)

