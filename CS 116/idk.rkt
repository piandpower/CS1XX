;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname idk) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
(define (gcd-Euclid n m)
  (cond
    [(zero? n) m]
    [(zero? m) n]
    [else (gcd-Euclid m (remainder m n))]))
(gcd-Euclid 2 4)