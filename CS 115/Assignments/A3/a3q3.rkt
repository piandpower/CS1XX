;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a3q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;******************************************************
;; CS 115 Assignment 3, Question 3
;; Christopher Alert
;;
;;(Calculating the maximum score of a hand for score-31)
;;
;;******************************************************

;; Assignment 3 Question 3

;; Defined structures

(define-struct card (value suit))
;; A card is a structure (make­card v s) where
;;v is an integer in the range from 2 to 11,	***note this range is different from the
;;	                                           range given in the course slides
;; s is a symbol from the set'hearts, 'diamonds, 'spades, and 'clubs.


;; Defined constants [cards]

(define ace<3 (make-card 11 'hearts))
(define one<3 (make-card 1 'hearts))
(define two<3 (make-card 2 'hearts))
(define three<3 (make-card 3 'hearts))
(define four<3 (make-card 4 'hearts))
(define five<3 (make-card 5 'hearts))
(define six<3 (make-card 6 'hearts))
(define seven<3 (make-card 7 'hearts))
(define eight<3 (make-card 8 'hearts))
(define nine<3 (make-card 9 'hearts))
(define ten<3 (make-card 10 'hearts))
(define jack<3 (make-card 10 'hearts))
(define queen<3 (make-card 10 'hearts))
(define king<3 (make-card 10 'hearts))
(define ace-clubs (make-card 11 'clubs))
(define one-clubs (make-card 1 'clubs))
(define two-clubs (make-card 2 'clubs))
(define three-clubs (make-card 3 'clubs))
(define four-clubs (make-card 4 'clubs))
(define five-clubs (make-card 5 'clubs))
(define six-clubs (make-card 6 'clubs))
(define seven-clubs (make-card 7 'clubs))
(define eight-clubs (make-card 8 'club))
(define nine-clubs (make-card 9 'clubs))
(define ten-clubs (make-card 10 'clubs))
(define jack-clubs (make-card 10 'clubs))
(define queen-clubs (make-card 10 'clubs))
(define king-clubs (make-card 10 'clubs))
(define ace-spad (make-card 11 'spades))
(define one-spad (make-card 1 'spades))
(define two-spad (make-card 2 'spades))
(define three-spad (make-card 3 'spades))
(define four-spad (make-card 4 'spades))
(define five-spad (make-card 5 'spades))
(define six-spad (make-card 6 'spades))
(define seven-spad (make-card 7 'spades))
(define eight-spad (make-card 8 'spades))
(define nine-spad (make-card 9 'spades))
(define ten-spad (make-card 10 'spades))
(define jack-spad (make-card 10 'spades))
(define queen-spad (make-card 10 'spades))
(define king-spad (make-card 10 'spades))
(define aceodi (make-card 11 'diamonds))
(define oneodi (make-card 1 'diamonds))
(define twoodi (make-card 2 'diamonds))
(define threeodi (make-card 3 'diamonds))
(define fourodi (make-card 4 'diamonds))
(define fiveodi (make-card 5 'diamonds))
(define sixodi (make-card 6 'diamonds))
(define sevenodi (make-card 7 'diamonds))
(define eightodi (make-card 8 'diamonds))
(define nineodi (make-card 9 'diamonds))
(define tenodi (make-card 10 'diamonds))
(define jackodi (make-card 10 'diamonds))
(define queenodi (make-card 10 'diamonds))
(define kingodi (make-card 10 'diamonds))



;;samesuit: card card card->boolean
;;Produces a value true if any two of the cards c1, c2 or c3
;; have the same suit. false otherwise
;;Examples:(samesuit (make-card 4 'spades)
;;                   (make-card 6 'diamonds)
;;                   (make-card 9 'spades))=>true
;;(samesuit (make-card 4 'clubs)
;;          (make-card 6 'diamonds)
;;          (make-card 9 'spades))=>false
(define (samesuit c1 c2 c3)
  (or (symbol=? (card-suit c1) (card-suit c2))
      (symbol=? (card-suit c1) (card-suit c3))
      (symbol=? (card-suit c2) (card-suit c3))))
;;Tests:
;;Two of same suit
(check-expect (samesuit (make-card 4 'spades)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) true)

(check-expect (samesuit (make-card 4 'diamonds)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) true)

(check-expect (samesuit (make-card 4 'spades)
                        (make-card 6 'clubs)
                        (make-card 9 'clubs)) true)
(check-expect (samesuit five<3 eight<3 kingodi) true)
;;Three of same suit
(check-expect (samesuit (make-card 11 'spades)
                        (make-card 10 'spades)
                        (make-card 10 'spades)) true)
(check-expect (samesuit oneodi twoodi jackodi) true)
(check-expect (samesuit one-clubs two-clubs jack-clubs) true)
(check-expect (samesuit one<3 two<3 jack<3) true)
;;None of same suit
(check-expect (samesuit (make-card 4 'hearts)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) false)
(check-expect (samesuit kingodi one-spad two-clubs) false)
(check-expect (samesuit kingodi one<3 two-clubs) false)
(check-expect (samesuit kingodi one<3 two-spad) false)

(check-expect (samesuit (make-card 4 'clubs)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) false)


;;score-31: card card card-> nat[0, 31]
;;Produces the score of a player's hand in the game score-31 by
;;calculating the sum of the values of the cards c1,c2 and c3
;;if and only if the cards added are of the same suit.
;;Example:(score-31 (make-card 4 'spades)
;;                  (make-card 6 'diamonds)
;;                  (make-card 9 'spades))=> 13
(define (score-31 c1 c2 c3)
  (cond [(samesuit c1 c2 c3) (cond[(and (symbol=? (card-suit c1) 
                                                  (card-suit c2))
                                        (symbol=? (card-suit c2)
                                                  (card-suit c3)))
                                   (+ (card-value c1)
                                      (card-value c2)
                                      (card-value c3))]
                                  [(symbol=? (card-suit c1)
                                             (card-suit c2))
                                   (max (+ (card-value c1)
                                           (card-value c2)) (card-value c3))]
                                  [(symbol=? (card-suit c1)
                                             (card-suit c3))
                                   (max (+ (card-value c1)
                                           (card-value c3)) (card-value c2))]
                                  [(symbol=? (card-suit c2)
                                             (card-suit c3))
                                   (max (+ (card-value c2)
                                           (card-value c3)) (card-value c1))])]
        [else 0]))
;;Tests:
;;Two of same suit
(check-expect (score-31 (make-card 4 'spades)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) 13)

(check-expect (score-31 (make-card 4 'diamonds)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) 10)

(check-expect (score-31 (make-card 4 'spades)
                        (make-card 6 'clubs)
                        (make-card 9 'clubs)) 15)

(check-expect (score-31 five<3 eight<3 kingodi) 13)

;;Third card bigger than sum of first two
(check-expect (score-31 (make-card 5 'diamonds)
                        (make-card 4 'diamonds)
                        (make-card 10 'spades)) 10)

(check-expect (score-31 (make-card 2 'spades)
                        (make-card 6 'diamonds)
                        (make-card 3 'spades)) 6)

(check-expect (score-31 (make-card 11 'spades)
                        (make-card 1 'clubs)
                        (make-card 2 'clubs)) 11)
;;Three of same suit
(check-expect (score-31 (make-card 11 'spades)
                        (make-card 10 'spades)
                        (make-card 10 'spades)) 31)
(check-expect (score-31 oneodi twoodi jackodi) 13)
(check-expect (score-31 one-clubs two-clubs jack-clubs) 13)
(check-expect (score-31 one<3 two<3 jack<3) 13)
;;None of same suit
(check-expect (score-31 (make-card 4 'hearts)
                        (make-card 6 'diamonds)
                        (make-card 9 'spades)) 0)
(check-expect (score-31 kingodi one-spad two-clubs) 0)
(check-expect (score-31 kingodi one<3 two-clubs) 0)
(check-expect (score-31 kingodi one<3 two-spad) 0)

                             
                          
                                 









