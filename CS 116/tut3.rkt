;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tut3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;Tutorial 3

;;; find (listof symbol) sym -> (listof nat)
;;; Returns the list of indices in alos with symbol sym
;;; (find '( a v d v) 'v) => '(1 3)
;;; (find '( a v d v) 'r) => empty
;(define (find alos sym)
;  (local
;    [;;find-acc: (listof symbol) num (listof num) -> (listof num)
;      (define (find-acc alos acc pos)
;       (cond [(empty? alos) empty]
;             [(equal? (first alos) sym)
;              (find-acc (rest alos) (add1 pos)
;                        (cons (pos acc)))]
;              [else (find-acc (rest alos) (add1 pos) acc)]))]
;    (reverse (find-acc alos 0 empty))))
;
;
;;;matches?: (listof symbol) (listof symbol)-> bolean
;;;Returns whether pat is a prefix of 1st
;(define (matches? lst pat)
;  (cond
;    [(empty? pat) true]
;    [(empty? lst) false]
;    [(equal? (first lst) (first pat))
;     (matches? (rest lst) (rest pat))]))
;
;;; find-pattern (listof symbol) (listof symbol) -> (listof nat)
;;; Returns the list of indices in alos with symbol sym
;;; (find '( a v d v) 'v) => '(1 3)
;;; (find '( a v d v) 'r) => empty
;(define (find-pattern alos pat)
;  (local
;    [;;find-acc: (listof symbol) num (listof num) -> (listof num)
;      (define (find-acc alos1 pos acc)
;       (cond [(empty? alos) empty]
;             [(equal? (first alos) sym)
;              (find-acc (rest alos) (add1 pos)
;                        (cons (pos acc)))
;              [else (find-acc (rest alos) (add1 pos) acc)]]))]
;    (reverse (find-acc alos 0 empty))))


;; build-number: (listof num)-> num 
;;Consumes a list of digits between - and 9
;;returns the corresponding number.
;;Examples:
;;(build-number '(9 0 8)) => 908
;;(build-number '(8 6))=> 86
(define (build-number lst)
  (local
    [;;accumulator is the number computed so far
     (define (build-number-acc lon acc)
       (cond
         [(empty? lon) acc]
         [else
          (build-number-acc
           (rest lon)
           (+ (* 10 acc)(first lon)))]))]
  (build-number-acc lst 0)))
(build-number '(9 0 8))
    