;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a4q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 4, Question 1                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Constructing a square grid from a list of numbers)     ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;

;; Question 1:

;; A grid is a list of lists of numbers with each sublist of length n.

;; make-grid: (listof num)-> grid
;; Consumes a list of numbers ,alon and produces the grid that represents
;; the list of numbers in the original ordering.
;; Examples:
;; (make-grid (list 1 2 3 4))
;;          => (list (list 1 2) (list 3 4))
;; (make-grid (list 0))=> (list (list 0))
;; (make-grid (list 1 2 3 4 5 6 7 8 9))
;;          => (list (list 1 2 3) (list 4 5 6) (list 7 8 9))
;; (make-grid (list 1 2 3 4 5 6 7 8 9))
;;          => (list (list 1 2 3) (list 4 5 6) (list 7 8 9))
(define (make-grid alon)
  (local
    [; the length of each row of the grid
     (define row-length (sqrt (length alon)))
     ;; div-list:
     ;; Consumes three lists of numbers, numbers,rows and rows in process
     ;; and produces the grid representing the list of numbers,numbers.
     (define (div-list numbers rows row-in-process)
       (cond
         [(empty? numbers) (append rows (list row-in-process))]
         [(= (length row-in-process) row-length) (div-list numbers (append rows (list row-in-process)) empty)]
         [else (div-list (rest numbers) rows (append row-in-process (list (first numbers))))]))]
    (div-list alon empty empty)))
;;Tests:
(check-expect (make-grid (list 1 2 3 4))
              (list (list 1 2) (list 3 4)))
(check-expect (make-grid (list 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
              (list (list 0 0 0 0)
                    (list 0 0 0 0) 
                    (list 0 0 0 0)
                    (list 0 0 0 0)))
(check-expect (make-grid (list 1 2 3 4 5 6 7 8 9))
              (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(check-expect (make-grid (list 0)) (list (list 0)))