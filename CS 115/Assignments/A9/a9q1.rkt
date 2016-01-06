;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a9q1) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 9, Question 1                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the height of a general tree)              ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;

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


;;Defined Constants:
(define prof-leafs (list (make-bball-stat "Sandy" 210 100 100 20)
                         (make-bball-stat "Jeff" 0 0 0 0)))
(define mike (make-bball-stat "MJ23" 1440 120 500 36))
(define ron  (make-bball-stat "Ron" 18 200 70 36))
(define lebron  (make-bball-stat "Lebron" 1080 300 220 36))
(define carmelo (make-bball-stat "Carmelo" 720 250 70 36))
(define wade  (make-bball-stat "Wade" 1260 70 450 36))
(define dreamteam (list mike ron lebron carmelo wade))

;;points-per-game: (listof bball-stat)-> (listof (listof (union string num)))
;;Consumes a list of players stats, team, and produces lista list of 
;;lists with the average points per game of each player.
;;Examples:
;;(points-per-game prof-leafs)=> (list (list "Sandy" 10.5) (list "Jeff" 0))
;;(points-per-game empty)=>empty
;;((points-per-game dreamteam)
;;                          =>(list (list "MJ23" 40)
;;                            (list "Ron" 0.5)
;;                            (list "Lebron" 30)
;;                            (list "Carmelo" 20)
;;                            (list "Wade" 35)))
(define (points-per-game team)
  (local
    [;;avg-score: bball-stat-> num
     ;;Consumes a bball-stat, player, and produces the player's average
     ;;score per game.
     (define (avg-score player)
       (cond
         [(= (bball-stat-games player) 0) 0]
         [else (/ (bball-stat-pts player) (bball-stat-games player))]))
     ;;my-combine: 
     ;;(listof string) (listof num)->(listof (listof (union string num)))
     ;;Consumes a lst1 a list of player names and lst2 with player
     ;;average scores,and produces a list of lists with first the
     ;;player's name and second their average score.
     (define (my-combine lst1 lst2)
       (cond
         [(empty? lst1) empty]
         [(empty? (rest lst1)) (cons (list (first lst1) (first lst2)) empty)]
         [else (cons(list (first lst1) (first lst2)) 
                    (my-combine (rest lst1) (rest lst2)))]))]
    (my-combine (map bball-stat-name team) (map avg-score team))))
;;Tests:
(check-expect (points-per-game prof-leafs)  
              (list (list "Sandy" 10.5) (list "Jeff" 0)))
(check-expect (points-per-game dreamteam)
              (list (list "MJ23" 40)
                    (list "Ron" 0.5)
                    (list "Lebron" 30)
                    (list "Carmelo" 20)
                    (list "Wade" 35)))
(check-expect (points-per-game empty) empty)

