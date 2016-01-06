;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |lab 9 notes|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))


;;Lockstep
(define (dot-product v1 v2)
(cond [(empty? v1) 0]
      [else (+ (* (first v1)
                  (first v2))
               (dot-product (rest v1) (rest v2)))]))

;;list along for ride
(define (matrix-times-vector matrix vector)
  (cond [(empty? matrix) empty]
        (else (cons (dot-product (first matrix) vector)
                    (matrix-times-vector (rest matrix) vector)))))


;;lab 9 q1 i think

(define (extract-value-1key key alist)
  (cond [(empty? alist) empty]
        [(equal? key (first(first alist)))
         (second (first alist))]
        [else (extract-value-1key key (rest alist))]))

(define (extract-values alok alist)
  (cond
    [(empty? alok) empty]
    [else (cons (extract-value-1key (first alok) alist)
                (extract-values (rest alok) alist))]))

(define my-alist (list (list 1 "hello") (list 2 "world")
                        (list 3 "one") (list 4 "cat")
                        (list 5 "two") (list 6 "dog")
                        (list 7 "Red") (list 8 "fish")
                        (list 9 "blue") (list 10 "fish")))