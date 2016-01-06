;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l3q7ii) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(define (front-letter str)
  (substring str 0 (- (string-length str) (- (string-length str) 1))))

(define (pig-aid1 str)
  (string-append str (front-letter str)))

(define (rem-wrd str)
  (substring str 1))

(define (pig-latin-beg str)
  (string-append str "ay"))


(define (pig-latin-beg2 str)
  ( pig-latin-beg (pig-aid1 (rem-wrd str))))

(pig-latin-beg2 "apple")