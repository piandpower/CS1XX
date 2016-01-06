;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |a9q4 working|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
(define lbox 10)
(define mbox 8)
(define sbox 6)
(define (l-boxes country-need)
  (cond
    [(= 9 country-need) 1]
    [(= 9 (remainder country-need lbox)) 
     (+ (quotient country-need lbox) 1)]
    [else (quotient country-need lbox)]))
(define (med-boxes country-need)
  (cond
    [(and (> 9 (remainder country-need lbox))
          (< 6 (remainder country-need lbox))) 
     (quotient (remainder country-need lbox) mbox)]
    [else 0]))
(define (s-boxes country-need)
  (cond
    [(> 6 (- country-need (+ (med-boxes country-need)  
                             (quotient country-need lbox))))
     (ceiling 
      (/ (- country-need (+ (med-boxes country-need)  
                            (quotient (remainder country-need lbox)))) sbox))]))
(med-boxes 7)

;;10s then 8's then 6's

;;3 cases: less than 9 req

;;(define (l-boxes country-need)
;;   (quotient country-need lbox

;;(define (med-boxes country-need)
;;(cond
;;   [(and (> 9 (remainder country-need lbox))
;;         (< 6 (remainder country-need lbox))) 
;;                        (quotient (remainder country-need lbox) mbox)]
;;   [else 0]

;;(define s-boxes
;;(cond
;;   [(> 6 (- country-need (+ (med-boxes country-need)  
;;       (quotient (remainder req lbox)]
;;   [else 0]

;; quotient bags needed & 10 = num lboxes

;; then (cond 
;;         (remainder 

;;(foldr cons empty (foldr + 0 (map l-boxes bags))
;;                  (foldr + 0 (map med-boxes bags))
;;                  (foldr + 0 (map s-boxes bags)))