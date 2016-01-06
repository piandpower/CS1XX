;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a9q3) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 9, Question 3                        ;;
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

(define prof-leafs-vs-ivy-league-profs
  (list (list (make-bball-stat "Lori" 50 50 100 10) 
              (make-bball-stat "Lori" 10 5 15 1))
        (list (make-bball-stat "J.P." 100 200 100 20)
              (make-bball-stat "J.P." 0 0 0 0))
        (list (make-bball-stat "Michael" 400 50 25 15) 
              (make-bball-stat "Michael" 30 8 0 1))))

;;Defined Constants:
(define mike (make-bball-stat "MJ23" 1000 120 500 36))
(define ron  (make-bball-stat "Ron" 300 200 70 36))
(define lebron  (make-bball-stat "Lebron" 700 300 220 36))
(define carmelo (make-bball-stat "Carmelo" 350 250 70 36))
(define wade  (make-bball-stat "Wade" 800 70 450 36))
(define dreamteam (list mike ron lebron carmelo wade))
(define dreamteamvsprof-leafs
  (list (list mike (make-bball-stat "MJ23" 2000 400 1000 1))
        (list ron (make-bball-stat "Ron" 100 600 5000 1))
        (list lebron (make-bball-stat "Lebron" 950 900 830 1))
        (list carmelo (make-bball-stat "Carmelo" 600 90 200 1))
        (list wade (make-bball-stat "Wade" 200 30 450 1))))

;;update-stats: (listof (pairof bball-stat))-> (listof (pairof bball-stat))
;;Consumes a list of bball-stat pairs, team, and produces the updated list of 
;;bball for the team's players.
;;Examples:
;;(update-stats prof-leafs-vs-ivy-league-profs)
;;=> (list (make-bball-stat "Lori" 60 55 115 11)
;;         (make-bball-stat "J.P." 100 200 100 20)
;;         (make-bball-stat "Michael" 430 58 25 16))
;;(update-stats dreamteamvsprof-leafs)=>
;;              (list (make-bball-stat "MJ23" 3000 520 1500 37)
;;                    (make-bball-stat "Ron" 400 800 5070 37)
;;                    (make-bball-stat "Lebron" 1650 1200 1050 37)
;;                    (make-bball-stat "Carmelo" 950 340 270 37)
;;                    (make-bball-stat "Wade" 1000 100 900 37))
(define (update-stats team)
  (local
    [
     (define (played? bballpair)
       (not (= (bball-stat-games (second bballpair)) 0)))
     ;;updated-stat: selector (pairof bball-stat)-> nat
     ;;Consumes a selector function and produces the value of
     ;;the updated statistic for the player.
     (define (updated-stat stat bballpair) 
       (foldr + 0 (map stat bballpair)))
     ;;update-player: (pairof bball-stat)->bball-stat
     ;;Consumes a player's pair of bbal stat, playerp, and produces the
     ;;updated bball-stat for that player.
     (define (update-player playerp)
       (local
         [ 
          (define caps (bball-stat-games (first playerp))) ;games a player has played
          (define player-name
            (bball-stat-name (first playerp)))] ;a player's name
         (cond 
           [(played? playerp)
            (make-bball-stat player-name 
                             (updated-stat bball-stat-pts playerp)
                             (updated-stat bball-stat-rebounds playerp)
                             (updated-stat bball-stat-assists playerp)
                             (+ 1 caps))]
           [else (make-bball-stat 
                  player-name 
                  (updated-stat bball-stat-pts playerp)
                  (updated-stat bball-stat-rebounds playerp)
                  (updated-stat bball-stat-assists playerp)
                  (+ 0 caps))])))]
    (foldr cons empty (map update-player team))))
;;Tests:
(check-expect
 (update-stats prof-leafs-vs-ivy-league-profs)
 (list (make-bball-stat "Lori" 60 55 115 11)
       (make-bball-stat "J.P." 100 200 100 20)
       (make-bball-stat "Michael" 430 58 25 16)))
(check-expect (update-stats dreamteamvsprof-leafs)
              (list (make-bball-stat "MJ23" 3000 520 1500 37)
                    (make-bball-stat "Ron" 400 800 5070 37)
                    (make-bball-stat "Lebron" 1650 1200 1050 37)
                    (make-bball-stat "Carmelo" 950 340 270 37)
                    (make-bball-stat "Wade" 1000 100 900 37)))
              
              