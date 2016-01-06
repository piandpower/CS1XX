;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l12q3) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
(define-struct card (value suit))
;; A card is a structure (make-card v s), where
;;      v is an integer in the range 1 to 10 and
;;      s is a symbol in the set 'hearts, 'diamonds, 'spades, and 'clubs.

;; Lab 12, Question 3

(define (count-suit clist asuit)
  (local
    [(define (is-suit? card)
       (cond[(equal? asuit (card-suit card)) 1]
            [else 0]))]
     (foldr + 0 (map is-suit? clist))))

(define (find-suit clist)
  (local
    [(define (is-suit? suit card)
       (equal? suit (card-suit card)))
     (define (is-hearts? card)
       (equal? 'hearts (card-suit card)))]
    (filter is-hearts? clist)))


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
(define Jack<3 (make-card 10 'hearts))
(define Queen<3 (make-card 10 'hearts))
(define King<3 (make-card 10 'hearts))
(define ace-club (make-card 11 'clubs))
(define one-club (make-card 1 'clubs))
(define two-club (make-card 2 'clubs))
(define three-clubs (make-card 3 'clubs))
(define four-clubs (make-card 4 'clubs))
(define five-clubs (make-card 5 'clubs))
(define six-clubs (make-card 6 'clubs))
(define seven-clubs (make-card 7 'clubs))
(define eight-clubs (make-card 8 'club))
(define nine-clubs (make-card 9 'clubs))
(define ten-clubs (make-card 10 'clubs))
(define Jack-clubs (make-card 10 'clubs))
(define Queen-clubs (make-card 10 'clubs))
(define King-clubs (make-card 10 'clubs))
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
(define Jack-spad (make-card 10 'spades))
(define Queen-spad (make-card 10 'spades))
(define King-spad (make-card 10 'spades))
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
(define Jackodi (make-card 10 'diamonds))
(define Queenodi (make-card 10 'diamonds))
(define Kingodi (make-card 10 'diamonds))


(count-suit (list 
              ace<3 one<3  
              two<3  
              three<3 
              four<3 
              five<3 
              six<3 
              seven<3 
              eight<3 
              nine<3
              ten<3  
              Jack<3  
              Queen<3 
              King<3  
              ace-club  
              one-club  
              two-club  
              three-clubs  
              four-clubs  
              five-clubs  
              six-clubs  
              seven-clubs 
              eight-clubs 
              nine-clubs  
              ten-clubs 
              Jack-clubs  
              Queen-clubs  
              King-clubs  
              ace-spad  one-spad 
              two-spad 
              three-spad  
              four-spad 
              five-spad  
              six-spad 
              seven-spad  
              eight-spad 
              nine-spad 
              ten-spad 
              Jack-spad  
              Queen-spad  
              King-spad
              aceodi 
              oneodi  
              twoodi  
              threeodi 
              fourodi  
              fiveodi 
              sixodi  
              sevenodi 
              eightodi 
              nineodi 
              tenodi  
              Jackodi  
              Queenodi Kingodi) 'hearts)