;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l5q1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;L5 Q 1

(define-struct game (winner loser high low)) 
;; A game is a structure (make-game w l hi lo), where 
;;	w is a string, ;;	l is a string, 
;;	hi is a nat, and 
;;	lo is a nat such that hi is greater than lo.


(define g6 (make-game "CVA" "lOl" 44 22))


(define (fixed-game gx)
  (make-game (game-winner gx)
             (game-loser gx)
             (+ (game-high gx) (game-low gx))
             0))

;;Tests:
(check-expect (fixed-game g6) (make-game "CVA" "lOl" 66 0))
