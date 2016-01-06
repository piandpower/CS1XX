;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a3q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;********************************************
;; CS 115 Assignment 3, Question 2
;; Christopher Alert
;;
;;(Replying to an email from a known sender)
;;
;;********************************************
;; Assignment 3 Question 2

;;Defining Structures

(define-struct contact (name email­address))
;;A contact is a structure (make­contact n e) where
;;n is a non‐empty string representing a person's name and
;;e is a non‐empty string representing a person's email address.

(define-struct email (from to subject message))
;;An email is a structure (make­email f t s m) where
;; f is a contact representing who sent the email,
;; t is a contact representing who received the email,
;; s is a string representing the subject of the email, and
;; m is a non‐empty string representing the text of the message.


;;Defining example contacts
(define me (make-contact "Chris Alert" "cvalert@uwaterloo.ca"))
(define ashley (make-contact "Ashley Bryan" "yelhsa123_4_@hotmail.com"))
;;Defining an example email
(define statistic (make-email me ashley "Long Distance"
                              "Long distance sucks!"))
(define example (make-email (make-contact "J.P. Pretti" 
                                          "jpretti@uwaterloo.ca")
                            (make-contact "Sandy Graham"
                                          "slgraham@uwaterloo.ca")
                            "Hello"
                            "I love CS115!"))



;;reply-msg: email string-> email
;;Produces a message of a string reply sentence to the 
;;email received, msg, in form email that is, the string ,text,
;; added to a space then the reply sender's name, a space, the
;; word ,said followed by another space and the original message
;;from the original e-mail{(email-message msg)}
;; Examples:
;;(reply-msg example "Me too.")=> "Me too. J.P. Pretti said I love CS115!")
;;(reply-msg example "I dont.")=> "I dont. J.P. Pretti said I love CS115!")
(define (reply-msg msg text) 
  (string-append text " " (contact-name (email-from msg)) " said "
                 (email-message msg)))
;;Tests:
(check-expect (reply-msg statistic "Yes it does :(")
              "Yes it does :( Chris Alert said Long distance sucks!")
(check-expect (reply-msg example "Me too.")
              "Me too. J.P. Pretti said I love CS115!")
(check-expect (reply-msg example "I dont.")
              "I dont. J.P. Pretti said I love CS115!")

;;reply: email string->email
;;Produces an email from the original email recipient, to the 
;;original email sender, with a subject that has "RE: " added 
;; before it and a message of a string reply sentence to the 
;;email received, msg, in form email that is, the string ,text,
;; added to a space then the reply sender's name, a space, the
;; word ,said followed by another space and the original message
;;from the original e-mail{(email-message msg)}
;;Example:
;;(reply statistic "Yep."):(make-email (make-contact "Ashley Bryan"
;;                                                 "yelhsa123_4_@hotmail.com")
;;                                    (make-contact "Chris Alert" 
;;                                                  "cvalert@uwaterloo.ca")
;;                                    "RE: Long Distance"
;;                             "Yep. Ashley Bryan said Long distance sucks!"))
(define (reply msg text)
  (make-email (email-to msg) 
              (email-from msg) 
              (string-append "RE: " (email-subject msg))
              (reply-msg msg text)))
;;Tests:
(check-expect 
 (reply statistic "Yes it does :(")
 (make-email (make-contact "Ashley Bryan" "yelhsa123_4_@hotmail.com")
             (make-contact "Chris Alert" "cvalert@uwaterloo.ca")
             "RE: Long Distance"
             "Yes it does :( Chris Alert said Long distance sucks!"))
(check-expect
 (reply statistic "")
 (make-email (make-contact "Ashley Bryan" "yelhsa123_4_@hotmail.com")
             (make-contact "Chris Alert" "cvalert@uwaterloo.ca")
             "RE: Long Distance"
             " Chris Alert said Long distance sucks!"))



 