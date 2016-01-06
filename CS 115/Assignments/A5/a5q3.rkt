;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a5q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 5, Question 3
;; Christopher Alert
;;
;;(Creating a list of contacts from a list of emails)
;; 
;;
;;*********************************************************

;; Question 3

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

;;Defined Constants
(define Chris (make-contact "Chris Alert" "alertus44@live.com"))
(define Ashley (make-contact "Ashley Bryan" "yelhsa123_4_@hotmail.com"))
(define Mother (make-contact "Gayle Medford" "gaylemedford@hotmail.com"))
(define email1 (make-email Chris Ashley "Hi" "ashley"))
(define email2 
  (make-email Chris Mother "Jacket"
              "$1000 on your card for the jacket, love you"))
(define email3 (make-email Mother Chris "Re:Jacket" 
                           "Get a job and pay off the cost!"))
(define email4 (make-email Chris Ashley "Long distance"
                           "This really isn't working.."))
(define email5 (make-email Chris Chris "pdf"
                           "See pdf attatched (forgot memory stick)"))
(define email6 (make-email Ashley Chris "Re:Long distance"
                           "Are you breaking up with me?"))
(define inbox 
  (cons email1 
        (cons email2 
              (cons email3 
                    (cons email4 (cons email5 (cons email6 empty)))))))
(define inbox-reduced (cons email1 (cons email5 (cons email3 empty))))
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

;;existing-contacts: (listof emails)-> (listof contacts)
;;Consumes a list of emails ,aloe, and produces a list of the 
;;the emails' sender or receiver contacts.
;;Examples:
;;(existing-contacts empty)=> empty
;;(existing-contacts inbox-reduced)=>
;;(cons Ashley
;;      (cons Chris 
;;            (cons Chris 
;;                  (cons Chris 
;;                        (cons Chris 
;;                              (cons Mother empty))))))
(define (existing-contacts aloe)
  (cond [(empty? aloe) empty]
        [else (cons (email-to (first aloe))
                    (cons (email-from (first aloe))
                          (existing-contacts (rest aloe))))]))
;;Tests:
(check-expect (existing-contacts empty) empty)
(check-expect (existing-contacts (cons email5 empty))
              (cons Chris (cons Chris empty)))
(check-expect (existing-contacts inbox-reduced) 
              (cons Ashley
                    (cons Chris 
                          (cons Chris 
                                (cons Chris 
                                      (cons Chris 
                                            (cons Mother empty)))))))

;;discard-user: str (listof contacts)-> (listof contact)
;;Consumes a list of contacts aloc and produces a list of contacts without
;;the user's email-address.
;;Examples:
;;(discard-user empty)=> empty
;;(discard-user (discard-user (contact-email-address Chris)
;;               (cons (email-to email5)
;;                     (cons (email-from email5) empty)))=>empty
;;(discard-user "alertus44@live.com" inbox-reduced)
;;=> (cons Ashley (cons Mother empty)
;;
(define (discard-user user-email-address aloc)
  (cond 
    [(empty? aloc) empty]    
    [else (cond 
            [(equal? (contact-email-address (first aloc))
                     user-email-address)
             (discard-user user-email-address (rest aloc))]
            [else (cons (first aloc) 
                        (discard-user user-email-address (rest aloc)))])]))
;;Tests:
(check-expect 
 (discard-user "m47liu@uwaterloo.ca" (existing-contacts my-emails))
 (cons (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
       (cons (make-contact "L. Case" "lcase@uwaterloo.ca") 
             (cons (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")empty))))
(check-expect 
 (discard-user (contact-email-address Chris)
               (cons (email-to email5)
                     (cons (email-from email5) empty)))empty)
(check-expect (discard-user "alertus44@live.com" 
                            (existing-contacts inbox-reduced))             
              (cons Ashley (cons Mother empty)))

;;discard-duplicates: str (listof any)-> (listof any)
;;Consumes a string, addy, and a list of contacts and produces
;; a list with all occurences of addy removed from aloc.
;;Examples:
;;(discard-duplicates empty)=>empty
;;(discard-duplicates (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
;;                    (discard-user "m47liu@uwaterloo.ca" (existing-contacts my-emails)))
;;=>(cons (make-contact "L. Case" "lcase@uwaterloo.ca") empty)
(define (discard-duplicates addy aloc)
  (cond [(empty? aloc) empty]
        [(equal? addy (first aloc)) (discard-duplicates addy (rest aloc))]
        [else (cons (first aloc) (discard-duplicates addy (rest aloc)))]))
;;Tests:
(check-expect (discard-duplicates (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
                                  (discard-user "m47liu@uwaterloo.ca" (existing-contacts my-emails)))
              (cons (make-contact "L. Case" "lcase@uwaterloo.ca") empty))
(check-expect (discard-duplicates "" empty) empty)


;;new-entries: (listof contact)=>(listof contact)
;;Consumes a listof contacts, aloc and produces a list of contacts
;;with no contacts repeated.
;;Examples:
;;(new-entries empty)=>empty
;;(new-entries (discard-user "m47liu@uwaterloo.ca" 
;;                            (existing-contacts my-emails)))
;; (cons (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
;;       (cons (make-contact "L. Case" "lcase@uwaterloo.ca")empty))
(define (new-entries aloc)
  (cond [(empty? aloc) empty]
        [else (cons (first aloc) (discard-duplicates (first aloc)
                                                     (new-entries (rest aloc))))]))
;;Tests:
(check-expect 
 (new-entries (discard-user "m47liu@uwaterloo.ca" 
                            (existing-contacts my-emails))) 
 (cons (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
       (cons (make-contact "L. Case" "lcase@uwaterloo.ca")empty)))
(check-expect 
 (new-entries (existing-contacts inbox)) (cons Ashley
                                               (cons Chris
                                                     (cons Mother empty))))
(check-expect (new-entries empty) empty)


;;make-address-book: str (listof email)-> (listof contact)
;;Consumes user-email-address and aloe , a list of emails and
;produces the list of any contacts who emails were sent to or
;;received from with no duplicates nor the user themself.
;;Example:
;;(make-address-book "" empty)=> empty
;;(make-address-book "m47liu@uwaterloo.ca" my-emails)
;;              =>(cons (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
;;                      (cons (make-contact "L. Case" "lcase@uwaterloo.ca")empty)
;;(make-address-book (contact-email-address Chris) inbox)
;;              => (cons Ashley (cons Mother empty))
(define (make-address-book user-email-address aloe)
  (cond [(empty? aloe) empty]
        [else (new-entries (discard-user user-email-address
                                         (existing-contacts aloe)))]))
;;Tests:
(check-expect (make-address-book "" empty) empty)
(check-expect (make-address-book "m47liu@uwaterloo.ca" my-emails)
              (cons (make-contact "J.P. Pretti" "jpretti@uwaterloo.ca")
                    (cons (make-contact "L. Case" "lcase@uwaterloo.ca")empty)))
(check-expect (make-address-book (contact-email-address Chris) inbox)
              (cons Ashley
                    (cons Mother empty)))
