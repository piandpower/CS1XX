;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l12q4) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;; Lab 12, Question 4

(define (switch-case str)
  (local
    [(define (case-swap char)
       (cond 
         [(not (char-alphabetic? char)) char]
         [(char-lower-case? char) (char-upcase char)]
         [(char-upper-case? char) (char-downcase char)]))]
     (list->string (map case-swap (string->list str)))))
(switch-case "YeLeOLrrTTLSOFMODMFfeifniefnd")