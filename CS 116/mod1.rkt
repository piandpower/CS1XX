;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname mod1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
;; Module 1 Exercises - Use abstract list functions to 
;; solve the following problems. Do not use structural
;; recursion in your solutions. Define all helper functions
;; using local.

;; Some of these problems were discussed in class, some 
;; were not. 

(define-struct residence (area floors occupants))
;; A neighbourhood is a list of residence structures.

;; Problem 1: write a function make-highrise which consumes
;; a neighbourhood and produces a new neighbourhood from it
;; in which all the residences have at least 5 floors
;; (those already at least 5 floors are unchanged in the 
;; new neighbourhood).

(define (make-highrise n)
  (map (lambda (r)
         (cond
           [(> (residence-floors r) 5) r]
           [else ;(set-residence-floors! r 5)]))
            ;n))
            (make-residence (residence-area r)
                            5
                            (residence-occupants r))]))
       n))
(define lor (list (make-residence 25 2 2) (make-residence 25 1 6) (make-residence 25 22 6) (make-residence 25 3 8) (make-residence 25 6 1) (make-residence 25 0 7)))
(define loe (list (make-residence 25 2 0) (make-residence 25 1 0) (make-residence 25 22 0) (make-residence 25 3 0) (make-residence 25 6 0) (make-residence 25 0 0)))

(define house1 (make-residence 25 2 0))

;; Problem 2: write a function occupied which consumes
;; a neighbourhood and produces the list of all the 
;; residences in the neighbourhood which are occupied
;; (i.e. > 0 occupants). 

(define (occupied n)
  (filter (lambda (r) (> (residence-occupants r) 0)) n))

;; Problem 3: write a function count-empty which consumes a 
;; neighbourhood and produces the number of residences in 
;; the neighbourhood which are unoccupied (i.e. 0 occupants).

(define (count-empty n)
  (length (filter (lambda (r) (zero? (residence-occupants r))) n)))

;; Problem 4: Write a function most-populous that consumes a 
;; neighbourhood and produces the residence with the greatest
;; number of people living in it. Produce 'empty symbol if
;; the neighbourhood is empty. 

(define (most-populous n)
  (local
    [(define (comparer r1 r2)
       (cond
         [(> (residence-occupants r1)
             (residence-occupants r2))
          r1]
         [else r2]))]
    (cond
      [(zero? (residence-occupants (foldr comparer (make-residence 0 0 0) n))) 'empty]
      [else (foldr comparer (make-residence 0 0 0) n)])))

;; Problem 5: Write a function crowded-houses which consumes
;; a non-empty neighbourhood, and produces the neighbourhood
;; containing only those residences whose average-space-per-
;; occupant is less than the average-space-per-occupant for
;; the entire list. [Note: this one is much harder!]

(define (crowded-houses n)
  (local
    [(define (avg-space r)
       (/ (residence-area r) (residence-occupants r)))
     (define listavg (/ (foldr + 0 (map avg-space (filter (lambda (res) (> (residence-occupants res) 0)) n))) (length n)))]
    (filter (lambda (r) (< (avg-space r) listavg)) (filter (lambda (res) (> (residence-occupants res) 0)) n))))