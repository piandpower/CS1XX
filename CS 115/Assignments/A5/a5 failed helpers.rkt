;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |a5 failed helpers|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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
       [(equal? (contact-email-address (email-from (first aloe))) user-emailaddress) 
         (cond [(discard-existing-contacts aloe) (new-entries user-emailaddress (rest aloe))]
               [else (cons (email-to (first aloe)) (new-entries user-emailaddress (rest aloe)))])]
        
        [(equal? (contact-email-address (email-to (first aloe))) user-emailaddress)
         (cond [(sender-in-rest? (email-from(first aloe)) aloe) (new-entries user-emailaddress (rest aloe))]
               [else (cons (email-from (first aloe)) (new-entries user-emailaddress (rest aloe)))])]))



;;samesuit: card card card->boolean
;;Produces a value true if at least 5 of the cards
;; have the same suit. false otherwise.
;;Examples:(samesuit (make-card 4 'spades)
;;                   (make-card 6 'diamonds)
;;                   (make-card 9 'spades))=>true
;;(samesuit (make-card 4 'clubs)
;;          (make-card 6 'diamonds)
;;          (make-card 9 'spades))=>false


;;Tests: