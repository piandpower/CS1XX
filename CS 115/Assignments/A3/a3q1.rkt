;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a3q1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;******************************************************
;; CS 115 Assignment 3, Question 1
;; Christopher Alert
;;
;;(Determining what kind of quadrilateral shape four
;; points form)
;;
;;******************************************************
;; Assignment 3 Question 1

;;Defining Constants

(define origin (make-posn 0 0))

;;gradient: posn posn-> num
;;Produces the gradient of the line between points m and n
;;Examples: (gradient (make-posn 1 1) (make-posn 0 0)=> 1
;;(gradient (make-posn 2 3) (make-posn 0 0)=> 3/2
(define (gradient m n)
  (cond [(= 0 (- (posn-x n) (posn-x m))) 'infinity]
        [else (/ (- (posn-y n) (posn-y m)) (- (posn-x n) (posn-x m)))]))
;;Tests:
(check-expect (gradient (make-posn 1 1) (make-posn 1 0)) 'infinity)
(check-expect (gradient (make-posn 1 1) origin) 1)
(check-expect (gradient origin (make-posn -1 1)) -1)
(check-expect (gradient (make-posn 2 3) origin) 3/2)

;; posn-length: posn posn-> num [not 0]
;;Produces the euclidean length of the line between
;;points j and k 
;;Examples: (posn-length (make-posn 1 1) (make-posn 2 1))=>1
(define (posn-length j k)
  (sqrt (+ (sqr (- (posn-x j) (posn-x k)))
           (sqr (- (posn-y j) (posn-y k))))))  
;;Tests:
(check-expect (posn-length (make-posn 1 1) (make-posn 2 1)) 1)
(check-expect (posn-length (make-posn 1 1) (make-posn 1 1)) 0)
(check-expect (posn-length (make-posn 10000 0) (make-posn 0 0)) 10000)

;;square: posn posn posn posn-> boolean
;;Produces boolean true if the four posns i ,j,k,l
;; are points on the cartesian plane whch form a square
;;with equal length sides and all perpendicular corners
;;Examples: (square? (make-posn 1 1) 
;;                   (make-posn 1 0) 
;;                   (make-posn 0 2) 
;;                   (make-posn 1 2))=> true
(define (square? a b c d) (and (cond [(symbol? (gradient a b)) (= 0 (gradient b c))]
                                     [(= 0 (gradient a b)) (symbol? (gradient b c))]
                                           [(and (number? (gradient a b)) (number? (gradient b c))) 
                                                 (= (gradient a b) (* -1 (gradient b c)))])          
                               (= (posn-length a b) 
                                  (posn-length b c) 
                                  (posn-length c d)
                                  (posn-length d a))))
;;Tests:
;;AB has slope zero
(check-expect (square? (make-posn 2 1)
                       (make-posn 1 1)
                       (make-posn 1 0) 
                       (make-posn 2 0)) true)
;;BC has slope zero
(check-expect (square? (make-posn -2 0)
                       (make-posn -2 4)
                       (make-posn 2 4) 
                       (make-posn 2 0)) true)
;; BC has infinite slope
(check-expect (square? (make-posn 2 1)
                       (make-posn 1 1)
                       (make-posn 1 0) 
                       (make-posn 2 0)) true)
;;AB has infinite slope
(check-expect (square? (make-posn 1 1) 
                       (make-posn 1 0) 
                       (make-posn 2 0) 
                       (make-posn 2 1)) true)
(check-expect (square? (make-posn 0 1) 
                       (make-posn 1 0) 
                       (make-posn 0 -1) 
                       (make-posn -1 0)) true)
(check-expect (square? (make-posn 0 1) 
                       (make-posn 1 0) 
                       (make-posn -1 -2) 
                       (make-posn -2 -1)) false);;; ask about divinding by zero ex. (1,1) (1,0) (2,0) (2,1)


;;gradient AND (gradient a d)= gradient (b c)

;;              (gradient a b) = (* -1 (gradient b c)))

;;              (gradient b a)= gradient (c d)

;;              (gradient a d) = (* -1 (gradient c d)

;;rhombus: posn posn posn posn-> boolean
;;Produces true if the euclidean length between the 
;;points a b c and d are all equal
;;
(define (rhombus? a b c d) (= (posn-length a b) 
                              (posn-length b c) 
                              (posn-length c d)
                              (posn-length d a)))

;;Tests:
(check-expect (rhombus? (make-posn 2 -3) 
                        (make-posn 6 5) 
                        (make-posn -2 1) 
                        (make-posn -6 -7)) true)
(check-expect (rhombus? (make-posn 0 0) 
                        (make-posn 3 -1) 
                        (make-posn 6 0) 
                        (make-posn 3 1)) true)
(check-expect (rhombus? (make-posn 0 1) 
                       (make-posn 1 0) 
                       (make-posn -1 -2) 
                       (make-posn -2 -1)) false)                        

;;rectangle: posn posn posn posn-> boolean
;;Produces boolean true if the four posns a ,b,c,d
;; are points on the cartesian plane which form a rectangle
;;with opposite sides of equal length and all perpendicular
;; corners
;;Examples: (rectangle? (make-posn 1 1) 
;;                      (make-posn 1 0) 
;;                   (make-posn 0 2) 
;;                   (make-posn 1 2))=> true
(define (rectangle? a b c d) (and 
                              (cond [(symbol? (gradient a b))
                                     (= 0 (gradient b c))]
                                    [(= 0 (gradient a b))
                                     (symbol? (gradient b c))]
                                    [(and (number? (gradient a b))
                                          (number? (gradient b c)))
                                     (= (gradient a b) (* -1 (gradient b c)))])
                              (cond [(symbol? (gradient a b))
                                     (and (symbol? (gradient c d))
                                          (= (gradient b c) (gradient a d)))]
                                    [(symbol? (gradient b c))
                                     (and (symbol? (gradient a d))
                                          (= (gradient a b) (gradient c d)))]
                                    [else (and (= (gradient a b) 
                                                  (gradient c d))
                                               (= (gradient b c)
                                                  (gradient a d)))])))
;;Tests:
(check-expect (rectangle? (make-posn 0 1) 
                          (make-posn 5 1) 
                          (make-posn 5 0)
                          (make-posn 0 0)) true)
(check-expect (rectangle? (make-posn -2 0) 
                          (make-posn -2 4) 
                          (make-posn 6 4)
                          (make-posn 6 0)) true)


;;parallelogram: posn posn posn posn-> boolean
;;Produces boolean true if the four posns a ,b,c,d
;; are points on the cartesian plane which form a                  
;;parallelogram such that, both pairs of opposite sides 
;; are parallel
;;Examples: (parallelogram? (make-posn 1 1) 
;;                          (make-posn 1 0) 
;;                          (make-posn 0 2) 
;;                          (make-posn 1 2))=> true
(define (parallelogram? a b c d) (cond [(and (number? (gradient a b)) 
                                             (number? (gradient c d))
                                             (number? (gradient b c))
                                             (number? (gradient a d)))
                                        (and (= (gradient a b)
                                                (gradient c d)) 
                                             (= (gradient b c)
                                                (gradient a d)))]
                                       [(and (symbol? (gradient a b))
                                             (symbol? (gradient c d)))
                                             (= (gradient b c)
                                                (gradient a d))]
                                       [(and (symbol? (gradient b c))
                                             (symbol? (gradient a d)))
                                             (= (gradient a b)
                                                (gradient c d))]
                                       [else false]))
;;Tests:
;;Not parallelogram
(check-expect (parallelogram? origin
                              (make-posn 6 9) 
                              (make-posn 12 8) 
                              (make-posn 3 4)) false)
;;AB , CD infinite gradient
(check-expect (parallelogram? (make-posn 0 1) 
                               origin 
                              (make-posn 2 2) 
                              (make-posn 2 3)) true)
;;BC, AD infinite gradient
(check-expect (parallelogram? (make-posn 1 1) 
                              (make-posn -1 0) 
                              (make-posn -1 2) 
                              (make-posn 1 3)) true)
;;Any parallelogram
(check-expect (parallelogram? (make-posn 2 2) 
                              (make-posn 1 0) 
                              (make-posn 3 2) 
                              (make-posn 4 4)) true)

;;trapezoid: posn posn posn posn-> boolean
;;Produces boolean true if the four posns a ,b,c,d
;; are points on the cartesian plane which form a            
;; trapezoid with one pair of opposite sides being parallel
;;Examples: (trapezoid? (make-posn 1 1) 
;;                      (make-posn 1 0) 
;;                   (make-posn 0 2) 
;;                   (make-posn 1 2))=> true
(define (trapezoid? a b c d) (cond [(and (number? (gradient a b)) 
                                         (number? (gradient c d))
                                         (number? (gradient b c))
                                         (number? (gradient a d)))
                                    (or (= (gradient a b)
                                           (gradient c d)) 
                                        (= (gradient b c)
                                           (gradient a d)))]
                                   [(symbol? (gradient a b))
                                    (symbol? (gradient c d))]
                                   [(symbol? (gradient b c))
                                    (symbol? (gradient a d))]
                                   [else false]))
;;Tests:
;;AB infinite slope
(check-expect (trapezoid? (make-posn -2 0) 
                          (make-posn -2 4) 
                          (make-posn 6 20) 
                          (make-posn 6 -50)) true)
(check-expect (trapezoid? (make-posn -2 0) 
                          (make-posn -2 4) 
                          (make-posn 6 8) 
                          (make-posn 6 -4)) true)
;;BC infinite slope
(check-expect (trapezoid? (make-posn 2 0) 
                          (make-posn 1 0) 
                          (make-posn 1 1) 
                          (make-posn 2 50)) true)
;;Any trapezoid
(check-expect (trapezoid? (make-posn -2 0) 
                          (make-posn -4 4) 
                          (make-posn 5 4) 
                          (make-posn 6 0)) true)
(check-expect (trapezoid? (make-posn 0 1) 
                          (make-posn 1 0) 
                          (make-posn -1 -2) 
                          (make-posn -2 -1)) true)
;;Not trapezoid
(check-expect (trapezoid? (make-posn -4 80) 
                          (make-posn -2 27) 
                          (make-posn 6 64) 
                          (make-posn 6 -50)) false)

;;identify-quad: posn posn posn posn-> symbol
;;Produces a symbol describing what four-sided shape the 
;;four posns consumed a b c and d form when plotted on 
;; the cartesian plane 
(define (identify-quad a b c d)
  (cond[(square? a b c d) 'square]
       [(rhombus? a b c d) 'rhombus]
       [(rectangle? a b c d) 'rectangle]
       [(parallelogram? a b c d) 'parallelogram]
       [(trapezoid? a b c d) 'trapezoid]
       [else 'quadrilateral]))
;;Tests:
;;Square
(check-expect (identify-quad (make-posn 0 1) 
                             (make-posn 1 0) 
                             (make-posn 0 -1) 
                             (make-posn -1 0)) 'square)
;;Rhombus
(check-expect (identify-quad (make-posn 2 -3) 
                             (make-posn 6 5) 
                             (make-posn -2 1) 
                             (make-posn -6 -7)) 'rhombus)
;;Rectangle
(check-expect (identify-quad (make-posn 0 1) 
                             (make-posn 1 0) 
                             (make-posn -1 -2) 
                             (make-posn -2 -1)) 'rectangle)
;;Parallelogram
(check-expect (identify-quad (make-posn 2 2) 
                              (make-posn 1 0) 
                              (make-posn 3 2) 
                              (make-posn 4 4)) 'parallelogram)
;;Trapezoid
(check-expect (identify-quad (make-posn 2 0) 
                             (make-posn 1 0) 
                             (make-posn 1 1) 
                             (make-posn 2 50)) 'trapezoid)
;;Quadrilateral
(check-expect (identify-quad (make-posn -4 80) 
                             (make-posn -2 27) 
                             (make-posn 6 64) 
                             (make-posn 6 -50)) 'quadrilateral)
