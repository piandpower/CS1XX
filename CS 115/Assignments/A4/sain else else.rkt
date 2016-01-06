;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |sain else else|) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;; Consumes a list of strings, los, and produces the sum of the lengths of the strings
(define (total-str-length los)
           (cond [(empty? los) 0]
                 [(empty? (rest los)) (string-length (first los))]
                 [else (+ (string-length (first los)) (total-str-length (rest los)))]))

(total-str-length (cons "one" (cons "four"(cons "fives" empty))))

;;consumes a list of strings and the total length of the list of strings 
;;and produces the average length of the string
(define (avg-str-length los)
  (/ (total-str-length los) (length los)))

(avg-str-length (cons "one" (cons "four"(cons "fives" empty))))

(define (long-enough? los avg)
  (cond 
    [(>= (string-length(first los)) avg) (cons (first los) (long-strings (rest los)))]
    [(< (string-length (first los)) avg) (long-strings (rest los))]))
               
    ;[(>= (string-length(first los)) (avg-str-length los (total-str-length los))) true]
     ;   [(< (string-length (first los)) (avg-str-length los (total-str-length los))) false]))
      ;                    first(rest los


(define (long-strings los)
  (cond [(empty? los) empty]
        [(long-enough? los (avg-str-length los)) (cons (first los) (long-strings (rest los)))]
        [else (long-strings (rest los))]))

;;Tests
(check-expect (long-strings (cons "blah" empty)) (cons "blah" empty))
(check-expect (long-strings (cons "one" (cons "four"(cons "fives" empty))))
                            (cons "four"(cons "fives" empty)))


       ; [(>= (string-length(first los)) (avg-str-length los (total-str-length los))) (cons (first los) (long-strings (rest los)))]
       ; [(< (string-length (first los)) (avg-str-length los (total-str-length los))) (long-strings (rest los))]))


       ; [(< (string-length (first los)) (avg-str-length los total)) (long-strings (rest los))]