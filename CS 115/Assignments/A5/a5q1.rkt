;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a5q1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*********************************************************
;; CS 115 Assignment 5, Question 1
;; Christopher Alert
;;
;;(Determining whether points are within a radar station's
;; range of vision)
;;
;;*********************************************************
;; Assignment 5, Question 1
;; Question 1

;;Constants:
(define loc1 (make-posn 0 0))
(define p1 (make-posn 0 100))
(define p2 (make-posn 100 0))
(define p3 (make-posn 50 0))
(define p4 (make-posn 0 50))
(define p5 (make-posn 25 75))
(define p6 (make-posn 75 25))
(define lop (cons p1(cons p2(cons p3(cons p4 (cons p5 (cons p6 empty)))))))
(define p-i (make-posn 20 -10))
(define p-ii (make-posn -100 0))
(define p-iii (make-posn 100 200))
(define p-iv (make-posn -90 -89))
(define my-lop (cons p-i (cons p-ii (cons p-iii (cons p-iv empty)))))

;; posn-length: posn posn-> num
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


;;identify-objects: posn num (listof posn)-> (listof posn)
;;Consumes a pson r-loc which represents the location of the radar station
;; a number which represents the radar's radius and a list of positions
;; l-ufos, and produces the list of posns which are within the chosen
;;radius of the station.
;;Examples:
;;(identify-objects (make-posn 0 0) 100
;;                  (cons (make-posn 20 -10) 
;;                        (cons (make-posn -100 0) 
;;                              (cons (make-posn 100 200)
;;                                   (cons (make-posn -90 -89) empty))))) 
;; => (cons (make-posn 20 -10) (cons (make-posn -100 0) empty))
;;(identify-objects loc1 5 lop)=> empty
;;(identify-objects loc1 40 empty)=> empty
(define (identify-objects r-loc radius l-ufos)
  (cond 
    [(empty? l-ufos) empty]
    [(<= (posn-length r-loc (first l-ufos)) radius)
     (cons (first l-ufos) (identify-objects r-loc radius (rest l-ufos)))]
    [else (identify-objects r-loc radius (rest l-ufos))]
    ))
;;Tests:
(check-expect (identify-objects loc1 40 empty) empty)
(check-expect (identify-objects loc1 100 my-lop) 
              (cons (make-posn 20 -10) (cons (make-posn -100 0) empty)))
(check-expect(identify-objects loc1 100 lop) lop)
(check-expect(identify-objects loc1 5 lop) empty)
(check-expect(identify-objects loc1 50 lop) (cons p3 (cons p4 empty)))
(check-expect(identify-objects loc1 100 lop) lop)