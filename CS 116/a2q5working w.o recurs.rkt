;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |a2q5working w.o recurs|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
(define (alt f A B C D)
  (append ( (lambda (val) (equal? (map min (map f A) (map f B) (map f C))
                                        (f A) (f B) (f C)))
  