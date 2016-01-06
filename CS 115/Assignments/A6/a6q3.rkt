;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a6q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 6, Question 3
;; Christopher Alert
;;
;;(Determining the winner of a match of golf or if the game
;; tied)
;;
;;*********************************************************

;; Question 3


(define-struct scorecard (name scores))
;; A scorecard is a structure (make-scorecard n s), where
;; 	n is a string representing the name of a golfer and
;; 	s is a list of natural numbers representing the numbers 
;;      of strokes made by the player.

;;Defined Constants

(define t (make-scorecard "Tiger" (list 3 3 3 3 12)))
(define ee (make-scorecard "e" (list 4 4 3 3)))
(define ln (make-scorecard "ln" (list 3 3 4 4)))
(define w (make-scorecard "Wife" (list 2 2 2 2 2)))
(define b (make-scorecard "LOL" (list 1 1 1 1 1)))
(define x (make-scorecard "x" (list 1 1 1 1 1)))
(define m (make-scorecard "Michael" (list 3 5 2 2 5))) 
(define j (make-scorecard "J.P." (list 3 3 3 2 4))) 
(define l (make-scorecard "Lori" (list 3 5 3 2 4))) 

;;scorekeeper: scorecard scorecard-> nat
;;Consumes two scorecard lscore1 and lscore2 and produces a
;;number which represents the number of wins for the player
;; on the first scorecard.
;;Examples:
;;(scorekeeper b t)=>5
;;(scorekeeper w b)=>0
;;(scorekeeper m t)=>3
;;(scorekeeper j t)=>2
(define (scorekeeper lscore1 lscore2)
  (cond 
    [(empty? (scorecard-scores lscore1)) 0]
    [(< (first (scorecard-scores lscore1)) (first (scorecard-scores lscore2)))
     (+ 1 (scorekeeper 
           (make-scorecard (scorecard-name lscore1) 
                           (rest (scorecard-scores lscore1)))
           (make-scorecard (scorecard-name lscore2) 
                           (rest (scorecard-scores lscore2)))))]
    [else (scorekeeper (make-scorecard (scorecard-name lscore1) 
                                       (rest (scorecard-scores lscore1)))
                       (make-scorecard (scorecard-name lscore2) 
                                       (rest (scorecard-scores lscore2))))]))
;;Tests:
(check-expect (scorekeeper b t) 5)
(check-expect (scorekeeper w b) 0)
(check-expect (scorekeeper m t) 3)
(check-expect (scorekeeper j t) 2)

;;match-play: scorecard scorecard-> string
;;Consumes two scorecard and produces the winner of the golf
;;match who won the most holes or "Tie" if there is a tied match.
;;Examples:
;;(match-play x b)=>"Tie"
;;(match-play m l)=>"Tie"
;;(match-play m t)=>"Michael"
;;(match-play w b)=>"LOL"
(define (match-play lscore1 lscore2)
  (cond [(= (scorekeeper lscore1 lscore2)
            (scorekeeper lscore2 lscore1)) "Tie"]
        [(> (scorekeeper lscore1 lscore2)
            (scorekeeper lscore2 lscore1)) 
         (scorecard-name lscore1)]
        [else (scorecard-name lscore2)]))
;;Tests:
(check-expect (match-play b t) "LOL")
(check-expect (match-play w b) "LOL")
(check-expect (match-play m t) "Michael")
(check-expect (match-play j t) "J.P.")
(check-expect (match-play m j) "J.P.")
(check-expect (match-play j m) "J.P.") 
(check-expect (match-play m l) "Tie")
(check-expect (match-play x b) "Tie")
(check-expect (match-play ee ln) "Tie")