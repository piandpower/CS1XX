;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |a9q1 working|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
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

;;Defined Constants:
;(define mike
;(define ron
;(define lebron
;(define carmelo
;(define wade

     ;;player-pts:(listof string) (listof num)-> (listof (union string num))
     ;;Consumes list1 of player names and list2 with player
     ;;average scores,and produces a list with first the
     ;;player's name and second their average score.
     (define (player-pts list1 list2)
       (cond
         [(empty? list1) empty]
         [else (list (cons (first list1) (cons (first list2) empty)))]))
  
  
(define (points-per-game team)
  (local
    [
     (define (avg-score player)
       (cond
         [(= (bball-stat-games player) 0) 0]
         [else (/ (bball-stat-pts player) (bball-stat-games player))]))
     (define (player-pts list1 list2)
       (cond
         [(empty? list1) empty]
         [else (list (cons (first list1) (cons (first list2) empty)))]))
     (define (my-combine list1 list2)
       (cond
         [(empty? (rest list1)) (list (first list1) (first list2))]
         [else (list (list (first list1) (first list2)) 
                     (my-combine (rest list1) (rest list2)))]))]
     (my-combine (map bball-stat-name team) (map avg-score team))))


(points-per-game (list (make-bball-stat "Sandy" 210 100 100 20)
                       (make-bball-stat "Jeff" 0 0 0 0)))

;;map fn that prod (list name  avg-points) onto list of structures

;;helpers: im thinkin this might use foldr lol :/

;;or 
;;double map

;; (foldr combine (map bball-stat-name lop) (map avg-score lop))

;;(define avg-score player
;; (cond
;;   [(= (bbal-stat-games player) 0) 0]
;;   [else (/ (bball-stat-pts player) (bball-stat-games player))]))

;; (playername: (define playername (bball-stat-name player))

;;(player-pts list1 list2)
;; (cond
;;   [(empty? list1) empty]
;;   [else (list (cons (first list1) (cons (first list2) empty)))]))

;; (map 


;(map bball-stat-name
;    (list (make-bball-stat "Jeff" 0 0 0 0) (make-bball-stat "Sandy" 210 100 100 20)))
