;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a5helper?) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (num-samesuit suit l-cards)
  (cond 
    [(empty? l-cards) 0]
    [(empty? (rest l-cards)) 1]
    [(equal? (card-suit (first l-cards))
             (card-suit (first (rest l-cards)))) (+ 1 (num-samesuit (rest l-cards)))]
    [else (num-samesuit (rest l-cards))]))