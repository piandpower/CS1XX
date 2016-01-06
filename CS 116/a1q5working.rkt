;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a1q5working) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
(define-struct course-result (title grades))
;; A course-result is a structure (make-course-result t g), where
;; t is a string (title of course), 
;; g is a gradelist (grades of all students in the course)

(define (a-worthy? n)
       (>= n 80))
     ;;
     (define (a-grades lon)
       (filter a-worthy? lon))
     ;;
     ;;
     (define (a-grade-count locr)
       (map length (map a-grades (map course-result-grades locr))))
     ;;
     (define (max-As courses) (foldr max 0 (a-grade-count courses))) ;the most number of
     ; A's in any course
     ;;
     ;;
     (define (max-course-As? n c)
       (equal? max-As (length (a-grades (course-result-grades c)))))
     
     ;;
     ;;
     (define (courses-with-max loc)
       (filter max-course-As? loc))
     (define (top-courses courses) (courses-with-max courses))
     
     (max-course-As?  2 (make-course-result "CS135" (list 90 37 90)))