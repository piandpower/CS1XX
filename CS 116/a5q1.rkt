;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a5q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
;;
;;********************************************************;;
;; CS 116 Assignment 5, Question 1                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining whether or not a string is a silly-string) ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;


;; Question 1

;; State Variables:
;; NOTE: We will be changing these values for the auto-testing of part (A).
;; Your function should make no assumptions about the values of a...f
;; in part (A). In part (B), assume the state variables have the values they
;; would have if first-map (part B) ran correctly.

;; a,b,c,d,f: any
;; initial values
(define a (void))
(define b (void))
(define c (void))
(define d (void))
(define f (void))

;; Structures:
(define-struct tweet (sender message))
;; A tweet is a structure (make-tweet s m) where
;;   s is a string for the sender's name,
;;   m is a string for the sender's message (with maximum length 140 characters)

;; (part A)

;; first-mutate: (void)
;; This function produces (void).
;; Effects: The function changes the value of a to a given tweet
;; (make-tweet "alice" "doing cs116 assignment"), changes b to 12,
;; c to the value of a, d to a different given tweet,
;; (make-tweet "bob" "nap time") and f to symbol 'book.
;; Examples:
;; where a is (void), b is (void), c is (void), d is (void) and f is (void),
;; calling the function (first-mutate),
;; a is (make-tweet "alice" "doing cs116 assignment")
;; b is 12
;; c is (make-tweet "alice" "doing cs116 assignemnt")
;; d is (make-tweet "bob" "nap-time") and f is 'book.
(define (first-mutate)
  (begin
    (set! a (make-tweet "alice" "doing cs116 assignment"))
    (set! b 12)
    (set! c a)
    (set! d (make-tweet "bob" "nap time"))
    (set! f 'book)))
;; Test cases for first-mutate
(check-expect
 (begin
   (first-mutate)
   (and (equal? a (make-tweet "alice" "doing cs116 assignment"))
        (equal? b 12)
        (equal? c (make-tweet "alice" "doing cs116 assignment"))
        (equal? d (make-tweet "bob" "nap time"))
        (equal? f 'book)))
 true)


;;                                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;                                                                                  ;;

;; (part B)

;; second-mutate: (void)
;; This function produces (void).
;; Effects: The function changes the value of a to "cat", changes b to
;; a given tweet, (make-tweet "alice" "assignment done!"), c to a given
;; tweet, (make-tweet "eve" "mutation is fun"), d to the same tweet as
;; b and changes f to (lambda (z) (sqr z)).
;; Examples:
;; where a is (make-tweet "alice" "doing cs116 assignment"),
;; b is 12, c is (make-tweet "alice" "doing cs116 assignment"),
;; d is (make-tweet "bob" "nap time") and f is 'book,
;; calling the function (first-mutate),
;; a is "cat"
;; b is (make-tweet "alice" "assignment done!")
;; c is (make-tweet "eve" "mutation is fun")
;; d is (make-tweet "alice" "assignment done!")
;; and f is (lambda (z) (sqr z)).
(define (second-mutate)
  (begin
    (set! a "cat")
    (set-tweet-message! c "assignment done!")
    (set! b c)
    (set-tweet-sender! d "eve")
    (set-tweet-message! d "mutation is fun")
    (set! c d)
    (set! d b)
    (set! f (lambda (z) (sqr z)))))
;; Test cases for second-mutate
(check-expect
 (begin
   (first-mutate)
   (second-mutate)
   (and (equal? a "cat")
        (equal? b (make-tweet "alice" "assignment done!"))
        (equal? c (make-tweet "eve" "mutation is fun"))
        (equal? d (make-tweet "alice" "assignment done!"))
        (equal? (f 2) 4)))
 true)
