;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a5q3idk) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 5, Question 3
;; Christopher Alert
;;
;;(Determining whether a person's hand of cards contains a 
;; flush)
;;
;;*********************************************************


(define-struct contact (name email-address))
;; A contact is a structure (make-contact n e) where
;; 	n is a non-empty string representing a person's name and
;; 	e is a non-empty string representing a person's email address.

(define-struct email (from to subject message))
;; An email is a structure (make-email f t s m) where
;; 	f is a contact representing who sent the email,
;; 	t is a contact representing who received the email,
;; 	s is a string representing the subject of the email, and
;; 	m is a non-empty string representing the text of the message.

(define my-emails 
  (cons(make-email (make-contact "M. liu" "m47liu@uwaterloo.ca")
                   (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
                   "Hello" "I love CS115!") 
       (cons (make-email (make-contact "L. Case" "lcase@uwaterloo.ca")
                         (make-contact "M. liu" "m47liu@uwaterloo.ca")
                         "Where is Jeff?" "Out of the country.") 
             (cons(make-email(make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
                             (make-contact "M. liu" "m47liu@uwaterloo.ca")
                             "Progress" "Which slide?") 
                  (cons(make-email(make-contact "M. liu" "m47liu@uwaterloo.ca")
                                  (make-contact "M. liu" "m47liu@uwaterloo.ca") 
                                  "Reminder" "Pick up the kids.") empty)))))

;; Question 3
(define (make-address-book user-email-address aloe)
  (cond [(empty? aloe) empty]
        [else (new-entries user-email-address aloe)]))



;; e-mails from user 
;;(equal? (contact-email-address (email-from (first aloe)) user-e-mail-adddress) 
;;                             (cond [(member? (e-mail-to (first aloe) (rest aloe)) (make-address-book (rest aloe))
;;                                   [else (cons (e-mail-to (first aloe)) (make-address-book (rest aloe)))])
;; e-mails to user 
;; (equal? (contact-email-address (e-mail-to (first aloe)) user-e-mail address)
;;        (cond [(member? (e-mail-from (first aloe) (rest aloe)) (make-address-book user-email-address (rest aloe))
;;              [else (cons (e-mail-from (first aloe)) (make-address-book user-email-address (rest aloe)))]
;; same user 
;; (equal? (email-to (first aloe) (email-from (first aloe)))

;; discard-existing-contacts-- remove
;; Consumes a contact and a list of emails
;; and produces a list of emails with none 
;; of the senders or receivers duplicated.
(define (discard-duplicates-receivers c1 aloe)
  (cond 
    [(empty? aloe) empty]
    [(equal? (email-to (first aloe)) (email-from (first aloe))) (discard-duplicates c1 (rest aloe))]
    [else (cond 
            [(or (equal? (email-to (first aloe)) c1) (equal? (email-from (first aloe)) c1))
             (discard-duplicate c1 (rest aloe))]
            [else (cons (first aloe) (discard-duplicate c1 (rest aloe)))])]))



;; discard-existing-contacts
(define (discard-existing-contacts aloe)
  (cond
    [(empty? aloe) empty]
    [else (cons (first aloe) (discard-duplicates (first aloe) (discard-existing-contacts (rest aloe))))]))










(define (receiver-in-rest? email-rec aloe)
  (cond
    [(empty? aloe) false]
    [(empty? (rest aloe)) false]
    [(equal? email-rec (email-to (first (rest aloe)))) true]
    [else (receiver-in-rest? email-rec (rest aloe))]))

(define (sender-in-rest? email-sender aloe)
  (cond 
    [(empty? aloe) false]
    [(empty? (rest aloe)) false]
    [(equal? email-sender (email-to (first (rest aloe)))) true]
    [else (sender-in-rest? email-sender (rest aloe))]))



(define (new-entries user-emailaddress aloe)
  (cond [(empty? aloe) empty]
        [(equal? (email-to (first aloe)) (email-from (first aloe))) (new-entries user-emailaddress (rest aloe))]
        
        [(equal? (contact-email-address (email-from (first aloe))) user-emailaddress) 
         (cond [(receiver-in-rest? (email-to (first aloe)) aloe) (new-entries user-emailaddress (rest aloe))]
               [else (cons (email-to (first aloe)) (new-entries user-emailaddress (rest aloe)))])]
        
        [(equal? (contact-email-address (email-to (first aloe))) user-emailaddress)
         (cond [(sender-in-rest? (email-from(first aloe)) aloe) (new-entries user-emailaddress (rest aloe))]
               [else (cons (email-from (first aloe)) (new-entries user-emailaddress (rest aloe)))])]))

;;Tests:                
(make-address-book "m47liu@uwaterloo.ca" my-emails)







