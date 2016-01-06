;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a1q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*******************************************
;; CS 115 Assignment 1, Question 3
;; Christopher Alert
;;
;; (Converting  number from the string of its
;; scientific notation)
;;
;;********************************************

;; power of 10 
;;pwr: str int[>= 2]-> num 
;;Produces the exponent of the scientific notation
;; expression sn-string, that is, a substring from
;; the sig-digits +5 position which encompasses 
;; exponent of 10 by which the decimal term is 
;; multiplied.
;;Examples:(pwr "1.457x10^9" 4)=>10000000000
;;(pwr "1.23456x10^-4" 6)=> .001
(define (pwr sn-string sig-digits) 
  (expt 10 (string->number (substring sn-string 
                                      (+ sig-digits 5)))
        )
  )
;;Tests for pwr
;;Positive exponent
(check-expect (pwr "1.457x10^9" 4) 1000000000)
;;Negative exponent
(check-expect (pwr "1.23456x10^-4" 6) .0001)

;; decimal in product

;; pull-deci: str int[>= 2] -> str
;; Produces the substring of length sig-digits +1 
;; of sn-string which contains the decimal value
;;  before multiplication by the exponent
;;Example: (pull-deci "1.457x10^9" 4)=> "1.457"
;;(pull-deci "0.7x10^9" 2)=> "0.7"
(define (pull-deci sn-string sig-digits)
  (substring sn-string 0 (+ sig-digits 1)))
;;Tests for pull-deci
(check-expect (pull-deci "0.7x10^9" 2) "0.7")
(check-expect (pull-deci "1.457x10^9" 4) "1.457")

;; Scientific notation string to number
  
;;sn->num: str int[>= 2] -> int [>= 0]
;; produces the number equivalent to  string
;; str of the scientific notation of a number
;; from the substring of length sig-digits +1
;;Example:(sn->num "1.457x10^9" 4)=> 1457000000
(define (sn->num sn-string sig-digits)
  (* (string->number (pull-deci sn-string sig-digits ))
     (pwr sn-string sig-digits)))
;;Tests for sn->num
(check-expect (sn->num "1.23456x10^-4" 6) 0.000123456)
(check-expect (sn->num "1.457x10^9" 4) 1457000000)
  
  