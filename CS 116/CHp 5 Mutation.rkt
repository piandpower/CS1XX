;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |CHp 5 Mutation|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
;; ;;mto start: 

;;(clean)- draw a clean board
;;posns are 11,12,13,21,22,23,31,32,33
;;to place an x: (ex pp)
;; to place an o: (oh pp)

(define goat-age 7)
goat-age
(define (fountain-of-youth a)
  (cond
    [(number? a) (- 10 a)]
    [else (string-length a)]))
(fountain-of-youth goat-age)

(set! goat-age (add1 7))
goat-age
(fountain-of-youth goat-age)


(set! goat-age "ya-mudda")
goat-age
(define goat1 (fountain-of-youth goat-age))


(set! goat1 (- goat1 10))
(fountain-of-youth goat-age)

;;practically set up a box w/ lucy age next to it...

;; first put 7 in

;; memory as a collection of mailboxes -- each w/ names(addresses) 
;; and as you define stuff you put info in the box.


;; simplify from left to right when evaluating (tracing) mutation.

;; drop-x : num-> (void)
;; Purpose:  produces (void)
;; EffectS: reduces the value of x by reduction               ; use parameter name in effects or purpose !!
;; Examples: if x has the value 10, and we call
;; (drop-x 4), then will have value of 6
(define (drop-x reduction)
  (set! x (- x reduction)))
(define x 20)

;; always define the constant you set to bang before you try banging it.!.

;;check-expect you test what you expect it to be..

;; you give check expect the variable name and the expected value

(check-expect x 0) ; only works for one test :S :S =s =s

;; ya roite !

;; check-expect evaluated after all calculations run first.


(drop-x 20)
x