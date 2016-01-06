;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a9q4) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 9, Question 4                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the height of a general tree)              ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;

;; A triplet is a list (list a b c) where
;;   a is a nat, 
;;   b is a nat, 
;;   c is a nat.


;;total-boxes: (listof nat)-> triplet
;;Consumes a list of bags required by countries, bags, and produces the 
;;triplet of the number of boxes of each type would be required to cover
;;all the bags.
;;Examples:
;;(total-boxes (list 12 29 7))=> (list 4 1 1)
;;(total-boxes (list 0))=> (list 0 0 0)
;;(total-boxes (list 9 109 20 45 58))=> (list 23 1 1)
;;(total-boxes (list 47 47 37 87 97))=> (list 28 5 0)
;;(total-boxes (list 12 12 12 12 12))=> (list 5 0 5)
(define (total-boxes bags)
  (local
    [(define lbox 10)
     (define mbox 8)
     (define sbox 6)
     ;;l-boxes: nat -> nat
     ;;Consumes the # bags needed, country-need by a particular country
     ;;produces the number of large boxes required for that country.
     (define (l-boxes country-need)
       (cond
         [(= 9 country-need) 1]
         [(= 9 (remainder country-need lbox)) 
          (+ (quotient country-need lbox) 1)]
         [else (quotient country-need lbox)]))
     ;;med-boxes: nat-> nat
     ;;Consumes the # of bags required by a country, country-need
     ;;and produces the number of medium-sized boxes that may be needed
     (define (med-boxes country-need)
       (cond
         [(and (> 9 (remainder country-need lbox))
               (< 6 (remainder country-need lbox))) 1]
         [else 0]))
     ;;s-boxes: nat -> nat
     ;;Consumes the # of bags required by a country, country-need,
     ;;and produces the number of small boxes required by that country.
     (define (s-boxes country-need)
       (cond
         [(> (- country-need 
                (* (l-boxes country-need) lbox)
                (* (med-boxes country-need) mbox)) 0) 1]
         [else 0]))]
    (foldr cons empty (list (foldr + 0 (map l-boxes bags))
                            (foldr + 0 (map med-boxes bags))
                            (foldr + 0 (map s-boxes bags))))))
;;Tests:
(check-expect (total-boxes (list 12 29 7)) (list 4 1 1))
(check-expect (total-boxes (list 9 109 20 45 58)) (list 23 1 1))
(check-expect (total-boxes (list 0)) (list 0 0 0))
(check-expect (total-boxes (list 12 12 12 12 12)) (list 5 0 5))
(check-expect (total-boxes (list 47 47 37 87 97)) (list 28 5 0))

