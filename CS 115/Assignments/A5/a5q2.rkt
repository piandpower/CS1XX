;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a5q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*********************************************************
;; CS 115 Assignment 5, Question 2
;; Christopher Alert
;;
;;(Determining whether a person's hand of cards contains a 
;; flush)
;;
;;*********************************************************


;; Question 2

(define-struct card (value suit)) 
;; A card is a structure (make-card v s) where
;;v is an integer in the range from 1 to 10, 
;;and s is a symbol from the set 'hearts, 'diamonds, 'spades, and 'clubs.

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
(define hand1 (cons tenodi 
                    (cons jackodi 
                          (cons king-spad 
                                (cons king<3 
                                      (cons fourodi empty)
                                      )))))
(define hand2 (cons one<3
                    (cons queen<3
                          (cons jack<3
                                (cons king<3
                                      (cons four<3 empty)
                                      )))))
(define hand3 (cons one-spad
                    (cons queen-spad
                          (cons jack-spad
                                (cons king-spad
                                      (cons four-spad empty)
                                      )))))
(define hand4 (cons one-clubs
                    (cons queen-clubs
                          (cons jack-clubs
                                (cons king-clubs
                                      (cons four-clubs empty)
                                      )))))
(define hand5
  (cons ten<3 
        (cons jackodi 
              (cons king-spad 
                    (cons king<3 
                          (cons fourodi
                                (cons four-clubs
                                      (cons jack-spad
                                            (cons ace-clubs empty)           
                                                  ))))))))
(define hand6 
  (cons (make-card 3 'diamonds) 
        (cons (make-card 9 'diamonds)
              (cons (make-card 8 'diamonds) 
                    (cons (make-card 1 'clubs)
                          (cons (make-card 1 'diamonds) 
                                (cons (make-card 10 'diamonds) empty)
                                ))))))

;;num-diamonds: (listof card)-> nat
;;Consumes a list of cards and produces the number of cards in the list
;;which have a diamond suit
;;Examples:
;;(num-diamonds 
;; (cons tenodi 
;;       (cons jackodi 
;;             (cons king-spad (cons king<3 (cons fourodi empty))))))=> 3
;;(num-diamonds hand5)=>2
;;(num-diamonds empty)=>0
(define (num-diamonds l-cards)
  (cond [(empty? l-cards) 0]
        [(equal? 'diamonds (card-suit (first l-cards))) (+ 1 (num-diamonds (rest l-cards)))]
        [else (num-diamonds (rest l-cards))]))
;;Tests:
(check-expect (num-diamonds hand5) 2)
(check-expect (num-diamonds empty) 0)
(check-expect (num-diamonds hand1) 3)
(check-expect (num-diamonds hand6) 5)

;;num-clubs: (listof card)-> nat
;;Consumes a list of cards and produces the number of cards in the list
;;which have a clubs suit
;;Examples:
;;(num-clubs 
;; (cons tenodi 
;;       (cons jackodi 
;;             (cons king-spad (cons king<3 (cons fourodi empty))))))=> 0
;;(num-clubs hand4)=>5
;;(num-clubs empty)=>0
(define (num-clubs l-cards)
  (cond [(empty? l-cards) 0]
        [(equal? 'clubs (card-suit (first l-cards))) (+ 1 (num-clubs (rest l-cards)))]
        [else (num-clubs (rest l-cards))]))
;;Tests:
(check-expect (num-clubs hand4) 5)
(check-expect (num-clubs empty) 0)
(check-expect (num-clubs hand5) 2)

;;num-hearts: (listof card)-> nat
;;Consumes a list of cards and produces the number of cards in the list
;;which have a hearts suit
;;Examples:
;;(num-hearts 
;; (cons tenodi 
;;       (cons jackodi 
;;             (cons king-spad (cons king<3 (cons fourodi empty))))))=> 1
;;(num-hearts hand4)=>5
;;(num-hearts empty)=>0
(define (num-hearts l-cards)
  (cond [(empty? l-cards) 0]
        [(equal? 'hearts (card-suit (first l-cards))) (+ 1 (num-hearts (rest l-cards)))]
        [else (num-hearts (rest l-cards))]))
;;Tests:
(check-expect (num-hearts hand2) 5)
(check-expect (num-hearts empty) 0)
(check-expect (num-hearts hand5) 2)

;;num-spades: (listof card)-> nat
;;Consumes a list of cards and produces the number of cards in the list
;;which have a spades suit
;;Examples:
;;(num-spades 
;; (cons tenodi 
;;       (cons jackodi 
;;             (cons king-spad (cons king<3 (cons fourodi empty))))))=> 1
;;(num-spades hand3)=>5
;;(num-spades empty)=>0
(define (num-spades l-cards)
  (cond [(empty? l-cards) 0]
        [(equal? 'spades (card-suit (first l-cards))) (+ 1 (num-spades (rest l-cards)))]
        [else (num-spades (rest l-cards))]))
;;Tests:
(check-expect (num-spades hand3) 5)
(check-expect (num-spades empty) 0)
(check-expect (num-spades hand5) 2)


;;flush?: (listof card) -> boolean
;;Consumes a list of cards , l-cards, and produces true if
;;the hand of cards has five of the same suit.
;;Examples:
;;(flush? hand2)=>true
;;(flush? hand3)=>true
;;(flush? hand4)=>true
(define (flush? l-cards)
  (cond [(empty? l-cards) false]
        [(< (length l-cards) 5) false]
        [(>= (num-diamonds l-cards) 5) true]
        [(>= (num-hearts l-cards) 5) true]
        [(>= (num-clubs l-cards) 5) true]
        [(>= (num-spades l-cards) 5) true]
        [else false]))
;;Tests:
(check-expect (flush? empty) false)
(check-expect (flush? 
               (cons (make-card 1 'diamonds) 
                     (cons (make-card 10 'diamonds) empty))) false)
(check-expect (flush? hand6) true)
(check-expect (flush? hand1) false)
(check-expect (flush? hand2) true)
(check-expect (flush? hand3) true)
(check-expect (flush? hand4) true)