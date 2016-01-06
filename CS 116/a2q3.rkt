;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a2q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;************************************************
;; CS 115 Assignment 2, Question 3
;;
;; Christopher Alert
;;
;;(Creating the subtotal score for Yahtzee dice
;; rolls )
;;
;;************************************************


;;one-tot: int[>=0] -> int
;;Produces the total score earned by the ones ones rolled
;; by multiplying the ones by one.
;;Examples: (ones-tot 11)=>11
;;(ones-tot 0)=> 0
(define (ones-tot ones)
  (* ones 1))
;;Tests:
(check-expect (ones-tot 5) 5)
(check-expect (ones-tot 0) 0)

;;twos-tot: int[>=0] -> int
;;Produces the total score earned by the twos 2's rolled
;; by multiplying the twos by 2.
;;Examples: (twos-tot 11)=>22
;;(twos-tot 0)=> 0
(define (twos-tot twos)
  (* twos 2))
;;Tests:
(check-expect (twos-tot 2) 4)
(check-expect (twos-tot 0) 0)

;;threes-tot: int[>=0] -> int
;;Produces the total score earned by the threes 3's rolled
;; by multiplying the threes by 3.
;;Examples: (threes-tot 11)=>33
;;(threes-tot 0)=> 0
(define (threes-tot threes)
  (* threes 3))
;;Tests:
(check-expect (threes-tot 3) 9)
(check-expect (threes-tot 0) 0)

;;fours-tot: int[>=0] -> int
;;Produces the total score earned by the four 4's rolled
;; by multiplying the fours by 4.
;;Examples: (fours-tot 11)=>44
;;(fours-tot 0)=> 0
(define (fours-tot fours)
  (* fours 4))
;;Tests:
(check-expect (fours-tot 4) 16)
(check-expect (fours-tot 0) 0)

;;fives-tot: int[>=0] -> int
;;Produces the total score earned by the five 5's rolled
;; by multiplying the fives by 5.
;;Examples: (five-tot 11)=>55
;;(fives-tot 0)=> 0
(define (fives-tot fives)
  (* fives 5))
;;Tests:
(check-expect (fives-tot 1) 5)
(check-expect (fives-tot 0) 0)

;;sixes-tot: int[>=0] -> int
;;Produces the total score earned by the six 6's rolled
;; by multiplying the sixes by 6.
;;Examples: (sixes-tot 11)=>66
;;(sixes-tot 0)=> 0
(define (sixes-tot sixes)
  (* sixes 6))
;;Tests:
(check-expect (sixes-tot 6) 36)
(check-expect (sixes-tot 0) 0)

;;yahtzee-subtotal:int[>=0] int[>=0] int[>=0] int[>=0] int[>=0] int[>=0]->int
;;Calculates the subtotal of the yahtzee card game by
;;multiplying ones by 1, twos by 2, threes by 3, fours by 4,
;;fives by 5 and sixes by 6.
;;Example: (yahtzee-subtotal 3 3 3 3 3 3)=>98
;;(yahtzee-subtotal 0 0 0 0 0 0 0)=>98
(define (yahtzee-subtotal ones twos threes fours fives sixes)
  (cond [(> 63 (+ (ones-tot ones)
                  (twos-tot twos)
                  (threes-tot threes)
                  (fours-tot fours)
                  (fives-tot fives)
                  (sixes-tot sixes))) (+ (ones-tot ones)
                                         (twos-tot twos)
                                         (threes-tot threes)
                                         (fours-tot fours)
                                         (fives-tot fives) 
                                         (sixes-tot sixes))]  
        [else (+ (+ (ones-tot ones)
                    (twos-tot twos)
                    (threes-tot threes)
                    (fours-tot fours)
                    (fives-tot fives)
                    (sixes-tot sixes))
                 35)]))
;;Tests:
(check-expect (yahtzee-subtotal 1 3 4 4 3 2) 62)
(check-expect (yahtzee-subtotal 3 3 3 3 3 3) 98)
(check-expect (yahtzee-subtotal 0 3 3 3 3 3) 60)
(check-expect (yahtzee-subtotal 0 0 3 3 3 3) 54)
(check-expect (yahtzee-subtotal 0 0 0 3 3 3) 45)
(check-expect (yahtzee-subtotal 0 0 0 0 3 3) 33)
(check-expect (yahtzee-subtotal 0 0 0 0 0 6) 36)
(check-expect (yahtzee-subtotal 1 1 1 1 1 1) 21)

             
  
