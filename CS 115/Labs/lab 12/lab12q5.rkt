;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab12q5) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))

;; Lab 12, Question 5

(define (count-even-strings alist)
  (local
    [(define (even-length? string)
       (or (zero? (remainder (string-length string) 2))
           (zero? (string-length string))))
     (define even-string-list (filter even-length? alist))]
    (length even-string-list)))
(count-even-strings (list "goat" "" "monki" "gyrate" "n" "R" "E"))