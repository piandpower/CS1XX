;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |l4q1 [notes?]|) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))


;;two-multiple: num num num-> (union int "both" "neither" false)
;; purpose: (two-multiples 4 0 0) false
;;          (two-multiples 4 2 2)=> "both"

(define( two-multiple target candidate1 candidate2)
  (cond[(or (zero? candidate1)(zero? candidate 2)) false]
       [and(zero? (remainder target candidate1))(zero? (remainder target candidate2))]
       [(zero? (remainder target candidate1)) candidate 1]
       [(zero?(remainder trget candidate2)) candidate2]
       [else "neither"]
;;Tests
(check-expect (two-multiple 4 1 0) false)
(check-expect (two-multiple 0 3 4) "both")
(check-expect (two-multiple 4 2 2) "both")
(check-expect (two-multiple 7 3 4) "neither")
(check-expect (two-multiple 4 2 3) 2)
(check-expect (two-multiple 1.2 4 5) false)
(check-expect (two-multiple 4 3 -2) -2)