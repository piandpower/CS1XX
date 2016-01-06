;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a2q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;************************************************
;; CS 115 Assignment 2, Question 4
;;
;; Christopher Alert
;;
;;(Determining which Pile to place the next card on
;; in 6 Nimmit)
;;
;;************************************************


;; Question 4


;;cant-place:int[1,104] int[1,104] int[1,104] int[1,104] int[1,104]
;;           -> boolean
;;Produces a boolean of true if the new-card is less
;;than the value of the top cards in each pile, false
;;otherwise.
;;Example:(cant-place 5 10 12 13 11)=>true
(define (cant-place new-card c1 c2 c3 c4)
  (and (< new-card c1)
       (< new-card c2)
       (< new-card c3)
       (< new-card c4)))
;;Tests:
(check-expect (cant-place 104 10 12 13 11) false)
(check-expect (cant-place 52 70 2 67 51) false)
(check-expect (cant-place 1 10 12 13 11) true)

;; pile-one: int[1,104] int[1,104] int[1,104] int[1,104] int[1,104]
;;              -> boolean
;;Produces a boolean of true if c1 is closest
;;in value to new-card of the top cards in the 
;;other piles c2 c3 c4, false otherwise.
;;Examples: (pile-one 102 78 19 33 34)=> true
;;(pile-one 83 30 4 33 89)=> false
(define (pile-one new-card c1 c2 c3 c4)
  (and (> new-card c1) 
       (or (< (- new-card c1) (- new-card c2)) (< (- new-card c2) 0))
       (or (< (- new-card c1) (- new-card c3)) (< (- new-card c3) 0))
       (or (< (- new-card c1) (- new-card c4)) (< (- new-card c4) 0))))
;;Tests:
(check-expect (pile-one 102 78 19 33 34) true)
(check-expect (pile-one 102 78 19 33 78) false)
(check-expect (pile-one 40 30 42 33 34) false)
(check-expect (pile-one 83 30 4 33 89) false)
(check-expect (pile-one 83 30 4 33 81) false)
  
;;pile-two: int[1,104] int[1,104] int[1,104] int[1,104]-> boolean
;;Produces a boolean of true if c2 is closer
;;in value to new-card than the value of the 
;; top cards in the other piles c3, c4, false otherwise.
;;Examples:(pile-two 32 19 33 34)=>true
;; (pile-two 4 19 33 34)=>false
  (define (pile-two new-card c2 c3 c4)
    (and (> new-card c2)
       (or (< (- new-card c2) (- new-card c3)) (< (- new-card c3) 0))
       (or (< (- new-card c2) (- new-card c4)) (< (- new-card c4) 0))))
;;Tests:
(check-expect (pile-two 32 19 33 34) true)
(check-expect (pile-two 4 19 33 34) false)
  
;;pile-three: int[1,104] int[1,104] int[1,104]-> boolean
;;Produces a boolean of true if c3 is closer
;;in value to new-card than the value of the top  
;; card in the other remaining pile,c4, false otherwise.
;;Examples: (pile-three 34 78 19 33 42)=> true
;; (pile-three 4 78 19 33 34)=> false
(define (pile-three new-card c3 c4)
  (and (> new-card c3) (or (< (- new-card c3) (- new-card c4)) (< (- new-card c4) 0))))
;;Tests:
(check-expect (pile-three 34 33 42) true)
(check-expect (pile-three 4 33 42) false)
   
;;place-card: int[1,104] int[1,104] int[1,104] int[1,104] int[1,104]
;;            -> symbol
;;Produces a symbol corresponding to the pile which new-card
;; will be placed on which is the closest in value to the top
;;cards c1,c2,c3 or c4 provided that new-card is larger in value
;;than the top card of the pile closest in value to it.
;;Examples: (place-card 4 78 19 33 34)=> 'Cannot-place
;; (place-card 32 78 19 33 34)=> 'Pile2
(define (place-card new-card c1 c2 c3 c4)
  (cond [(cant-place new-card c1 c2 c3 c4) 'Cannot-place]
        [else (cond[(pile-one new-card c1 c2 c3 c4)'Pile1]
                   [(pile-two new-card c2 c3 c4) 'Pile2]
                   [(pile-three new-card c3 c4)'Pile3]
                   [else 'Pile4])]))          
;;Tests:
(check-expect (place-card 32 78 19 33 34) 'Pile2)
(check-expect (place-card 4 78 19 33 34) 'Cannot-place)
(check-expect (place-card 53 78 19 33 34) 'Pile4)
(check-expect (place-card 102 78 19 33 34) 'Pile1)
(check-expect (place-card 34 78 19 33 42) 'Pile3)
