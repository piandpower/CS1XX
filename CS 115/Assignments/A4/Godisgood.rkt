;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Godisgood) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Consumes a list of strings, los, and produces the sum of the lengths of the strings

(define (total-str-length los)
           (cond [(empty? los) 0]
                 [(empty? (rest los)) (string-length (first los))]
                 [else (+ (string-length (first los)) (total-str-length (rest los)))]))
;;Tests:
(check-expect (total-str-length empty) 0)
(check-expect (total-str-length (cons "one" (cons "four"(cons "fives" empty)))) 12)


;;consumes a list of strings and the total length of the list of strings 
;;and produces the average length of the string
(define (avg-str-length los)
  (/ (total-str-length los) (length los)))

(check-expect (avg-str-length (cons "one" (cons "four"(cons "fives" empty)))) 4)


;;long-enough? (listof str) num->
(define (long-enough? los avg)
  (cond 
    [(empty? los) empty]
    [(empty? (rest los)) los]
    [(>= (string-length(first los)) avg) (cons (first los) (long-enough? (rest los)))]
    [else (long-enough? (rest los) (avg-str-length los))
;;Tests:
(check-expect (long-enough? (cons "one" (cons "four"(cons "fives" empty))) 
                            (avg-str-length (cons "one" (cons "four"(cons "fives" empty))))) )

;(define avg (avg-str-length los))


(define (long-strings los)
  (cond [(empty? los) empty]
        [(empty? (rest los)) los]
        [(long-enough? los (avg-str-length los)) (cons (first los) (long-strings (rest los)))]
        [else (long-strings (rest los))]))

(check-expect (long-strings (cons "blah" empty)) (cons "blah" empty))
(check-expect (long-strings (cons "one" (cons "four"(cons "fives" empty))))
                            (cons "four"(cons "fives" empty)))




;(define (long-strings los)
  ;(cond [(empty? los) empt]
   ;     [else ... (frist alist)... (lons-strings (rest alist)..)])
  ;...)
          
;[else ... (frist alist)... (lons-strings (rest alist)..)])         
;length..
;string-length ..
         