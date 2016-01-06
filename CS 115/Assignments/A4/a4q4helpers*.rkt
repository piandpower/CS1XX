;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q4helpers*) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(define (total-str-length los)
           (cond [(empty? los) 0]
                 [(empty? (rest los)) (string-length (first los))]
                 [else (+ (string-length (first los)) (total-str-length (rest los)))]))

(total-str-length (cons "one" (cons "four"(cons "fives" empty))))

(define (avg-str-length los total)
  (/ (total-str-length los) (length los)))

(avg-str-length (cons "one" (cons "four"(cons "fives" empty))) (total-str-length (cons "one" (cons "four"(cons "fives" empty)))))
