;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a1interface) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "taxon.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "taxon.ss" "installed-teachpacks")))))
;; Question 1 
(define (count-multiples numbers n)
  ...)

;; Question 2
(define (alter-string s)
  ...)
         
;; Question 3 
(define-struct clock (hour min))
;; A clock is a structure (make-clock h m), where
;; h is an integer between 0 and 23 (the hour of the day, 0 is midnight)
;; m is an integer between 0 and 59 (the minute after the hour h)

(define-struct appointment (title start end))
;; An appointment is a structure (make-appointment s e), where
;; t is a string (the title of the appointment),
;; s is a clock (for the starting time of an appointment),
;; e is a clock (for the ending time of an appointment)
;; and s, e refer to times on the same day, and s occurs before e. 

(define (cancel-long-appointments appts too-long)
  ...)


;; Question 4
(define-struct tweet (sender message))
;; A tweet is a structure (make-tweet s m) where
;; s is a string for the sender's name, 
;; m is a string for the sender's message (maximum length 140 characters). 

(define (average-tweet-length tweets id)
  ...)

;; Question 5
;; A gradelist is empty, or (cons g gl), where
;; g is a nat between 0 and 100, and
;; gl is a gradelist. 

(define-struct course-result (title grades))
;; A course-result is a structure (make-course-result t g), where
;; t is a string (title of course), 
;; g is a gradelist (grades of all students in the course)

(define (most-As courses)
  ...)
     