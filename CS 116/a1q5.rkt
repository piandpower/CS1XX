;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a1q5) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 1, Question 5                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the course(s) with the highest number of A ;;
;; grades )                                               ;;
;;                                                        ;;
;;********************************************************;;
;;


;; Question 5
;; A gradelist is empty, or (cons g gl), where
;; g is a nat between 0 and 100, and
;; gl is a gradelist. 

(define-struct course-result (title grades))
;; A course-result is a structure (make-course-result t g), where
;; t is a string (title of course), 
;; g is a gradelist (grades of all students in the course)

;;most-As: (listof course-result)-> (listof str)
;;Consumes a list of courses, courses, and produces the list of the names of
;;courses that obtained the highest number of A grades that any individual
;;course achieved.
;;Examples:
;;(most-As(list (make-course-result "CS115" (list 89 72 45 96 80))  
;;               (make-course-result "CS135" (list 90 37 90)) 
;;               (make-course-result "CS100" (list 70 80 90 85 40))))  
;; =>(list "CS115" "CS100"))
;;(most-As  (list  (make-course-result "CS115" (list 89 45 80))  
;;                  (make-course-result "CS135" (list 90 37 90))))  
;; => (list "CS115" "CS135"))
;;(most-As  (list  (make-course-result "CS115" (list 89 72 45 96 80))  
;;                  (make-course-result "CS135" (list 90 37 90))))  
;; => (list "CS115")
;;(most-As  (list  (make-course-result "CS115" (list 78 72 45 76 79))  
;;                  (make-course-result "CS135" (list 70 37 70))))  
;; => (list "CS115" "CS135")
;;(most-As(list (make-course-result "CS115" (list 89 72 45 96 80))  
;;               (make-course-result "CS135" (list 90 37 90 98)) 
;;               (make-course-result "CS100" (list 70 80 90 85 40))))  
;; =>(list "CS115" "CS135" "CS100"))
(define (most-As courses)
  (local
    [;;a-worthy?: nat-> boolean
     ;;Consumes a nat n and produces true if its more than or equal to 80.
     (define (a-worthy? n)
       (>= n 80))
     ;;a-grades: (listof nat)-> (listof nat)
     ;;Consumes a list of natural numbers, lon and produces the list of
     ;;numbers from the original which are above or equal to 80.
     (define (a-grades lon)
       (filter a-worthy? lon))
     ;;a-grade-count: (listof course-result)-> (listof nat)
     ;;Consumes a list of course-result and produces a list of numbers 
     ;;representing the number of A's in each course.
     (define (a-grade-count locr)
       (map length (map a-grades (map course-result-grades locr))))
     (define max-As (foldr max 0 (a-grade-count courses))) 
     ;the most number of A's in any inputted course
     ;;max-course-As?: course-result -> boolean
     ;;Consumes a course-result c and produces true if the number of grades
     ;;above 80 for the course is equal to the most number of A's in any one
     ;;course.
     (define (max-course-As? c)
       (equal? max-As (length (a-grades (course-result-grades c)))))
     ;;courses-with-max: (listof course-result) -> (list-of course-result)
     ;;Consumes a list of course-result loc and produces the list of course(s)
     ;;which each have the highest number of A's in any one course.
     (define (courses-with-max loc)
       (filter max-course-As? loc))
     (define top-courses (courses-with-max courses)) ;the list of courses
     ;inputted which have the most number of grade A's
     ]
    (map course-result-title top-courses)))
;;Tests
(check-expect
 (most-As  (list  (make-course-result "CS115" (list 89 72 45 96 80))  
                  (make-course-result "CS135" (list 90 37 90))))  
 (list "CS115")) 
(check-expect
 (most-As  (list  (make-course-result "CS115" (list 89 45 80))  
                  (make-course-result "CS135" (list 90 37 90))))  
 (list "CS115" "CS135"))
(check-expect 
 (most-As(list (make-course-result "CS115" (list 89 72 45 96 80))  
               (make-course-result "CS135" (list 90 37 90)) 
               (make-course-result "CS100" (list 70 80 90 85 40))))  
(list "CS115" "CS100"))
(check-expect
 (most-As  (list  (make-course-result "CS115" (list 78 72 45 76 79))  
                  (make-course-result "CS135" (list 70 37 70))))  
 (list "CS115" "CS135")) 
(check-expect (most-As(list (make-course-result "CS115" (list 89 72 45 96 80))  
               (make-course-result "CS135" (list 90 37 90 98)) 
               (make-course-result "CS100" (list 70 80 90 85 40))))  
(list "CS115" "CS135" "CS100"))
