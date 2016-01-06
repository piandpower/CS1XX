;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a9q2) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 9, Question 2                        ;;
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

;; A (pairof bball-stat) is a list (list a b) where
;;   a is a bball-stat structure, and 
;;   b is a bball-stat structure.

;;Defined Constants:
(define prof-leafs(list (make-bball-stat "Sandy" 210 100 100 20)
                        (make-bball-stat "Jeff" 0 0 0 0)
                        (make-bball-stat "Lori" 180 50 50 10)
                        (make-bball-stat "J.P." 500 200 35 20)
                        (make-bball-stat "Michael" 10 50 100 15)))
(define semi-prof-leafs(list (make-bball-stat "Sandy" 210 50 100 20)
                        (make-bball-stat "Jeff" 0 0 0 0)
                        (make-bball-stat "Lori" 180 50 50 10)
                        (make-bball-stat "J.P." 500 50 35 20)
                        (make-bball-stat "Michael" 10 50 100 15)))
;;Defined Constants:
(define mike (make-bball-stat "MJ23" 1000 120 500 36))
(define ron  (make-bball-stat "Ron" 300 200 70 36))
(define lebron  (make-bball-stat "Lebron" 700 300 220 36))
(define carmelo (make-bball-stat "Carmelo" 350 250 70 36))
(define wade  (make-bball-stat "Wade" 800 70 450 36))
(define dreamteam (list mike ron lebron carmelo wade))

;;above-average-rebounds: (listof bball-stat)-> (listof string)
;;Consumes a list of bball-stat, team, and produces the list of
;;names of players whose rebound tally is above the team average.
;;Examples:
;;(above-average-rebounds empty)=> empty
;;(above-average-rebounds semi-prof-leafs)=> empty
;;(above-average-rebounds dreamteam)=> (list "Ron" "Lebron" "Carmelo")
;;(above-average-rebounds prof-leafs)=> (list "J.P.")
(define (above-average-rebounds team)
  (local
    [
     ;;capped?: bball-stat-> boolean
     ;;consumes a bball0stat, player and produces true if the player
     ;;has played at least one game.
     (define (capped? player) 
       (not (= (bball-stat-games player) 0)))
     ;;active-squad: (listof bball-stat)-> (listof bball-stat)
     ;;Consumes a list of player bball-stats , team, and produces
     ;; the list of players who have played at least one game.
     (define (active-squad team)
       (filter capped? team))
     (define regulars (active-squad team)) ;the list of players who have
                                           ;a at least one game played.
     ;;avg-rebounds: (listof bball-stat)-> num
     ;;Consumes a list of bball-stat and produces the average rebounds
     ;; for the team not including players who have played no games.
     (define (avg-rebounds team)
       (cond
         [(empty? team) 0]
         [else (/ (foldr + 0 (map bball-stat-rebounds team))
                  (length regulars))]))
     (define teamaverage (avg-rebounds team)) ;the team average rebound total
     ;;above-avg?: bball-stat-> boolean
     ;;Consumes a bball-stat, player, and produces true if their rebound
     ;; tally is above the team average rebound total.
     (define (above-avg? player)
       (> (bball-stat-rebounds player) teamaverage))]
    (cond
      [(empty? team) empty]
      [else 
       (foldr cons empty 
              (cond
                [(empty? (map bball-stat-name (filter above-avg? team)))
                 empty]
                [else (map bball-stat-name (filter above-avg? team))]))])))
;;Tests:
(check-expect (above-average-rebounds prof-leafs) (list "J.P."))
(check-expect (above-average-rebounds empty) empty)
(check-expect (above-average-rebounds semi-prof-leafs) empty)
(check-expect (above-average-rebounds dreamteam) (list "Ron" "Lebron" "Carmelo"))