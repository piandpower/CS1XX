;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a4q5) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 4, Question 5                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Constructing a square grid from a list of numbers)     ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;


;; Question 5

;; num-comps: (listof num)-> nat
;; Consumes a list of numbers and produces the number of times
;; insertion sort would compare elements of the list.
;; Examples:
;; (num-comps (list 8 2 6 0 1 3))=> 11
;; (num-comps (list 5 4 3 2 1))=> 10
;; (num-comps (list 1 2 3 4 5))=> 4
;; (num-comps (list 8 2 6 0 1 3))=> 11
(define (num-comps alon)
  (local
    [;; split-list: (listof nat) (listof nat)-> (listof (listof nat))
     ;; Consumes two list of numbers,lst and so-far (initially empty)
     ;; and produces sublists of the lists including the first element
     ;; and the rest of the list for each element.
     (define (split-list lst so-far)
       (cond
         [(empty? (rest lst)) (append so-far (list (list (first lst))))]
         [else (split-list (rest lst) (append so-far (list lst)))]))
     ;; counter: (listof nat) nat nat-> nat
     ;; Consumes a list of natural numbers,lon, and two natural numbers
     ;; and produces the number of numbers in the rest of the list smaller
     ;; than the first number.
     (define (counter lon n ct)
       (cond
         [(empty? lon) ct]
         [(< n (first lon)) (add1 ct)]
         [else (counter (rest lon) n (add1 ct))]))
     ;; comp-counter: 
     ;; Consumes a list of lists of natural numbers and produces the
     ;; sum of all the counts of numbers in the rest of the lists smaller
     ;; than the first. That is, the number of comparisons insertion sort
     ;; would make if called on the original list.
     (define (comp-counter llon num)
       (cond
         [(empty? llon) num]
         [else (comp-counter (rest llon) (+ num
                                            (counter (rest (first llon))
                                                     (first (first llon))
                                                     0)))]))]
    (comp-counter (split-list alon empty) 0)))
;; Tests:
(check-expect (num-comps (list 1 2 3 4 5)) 4)
(check-expect (num-comps (list 5 4 3 2 1)) 10)
(check-expect (num-comps (list 8 2 6 0 1 3)) 11)

