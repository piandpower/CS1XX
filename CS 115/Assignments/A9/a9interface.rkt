;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a9interface) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))


;;Assignment 9

(define-struct bball-stat (name pts rebounds assists games))
;; A bball-stat is a structure (make-bball-stat n p r a g) where, 
;;  n is a string representing the name of a player
;;  p is a nat representing the total number of points in the season
;;  r is a nat representing the total number of rebounds in the season
;;  a is a nat representing the total number of assists in the season
;;  g is a nat representing the total number of games played in the season

;; A pair is a list (list a b) that contains exactly 2 elements.

;; A (pairof string num) is a list (list a b) where
;;   a is a string, and
;;   b is a num[>=0].

;; A (pairof bball-stat) is a list (list a b) where
;;   a is a bball-stat structure, and 
;;   b is a bball-stat structure.

;; A triplet is a list (list a b c) where
;;   a is a nat,
;;   b is a nat, and
;;   c is a nat.

(define (points-per-game team)
  ...)

(define (above-avg-rebounds team)
  ...)

(define (update-stats team)
  ...)

(define (total-boxes bags)
  ...)