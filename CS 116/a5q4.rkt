;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a5q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
;;
;;********************************************************;;
;; CS 116 Assignment 5, Question 4                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Encoding and deciphering a string of text using a      ;;
;; Caesar Cipher  -olnhbwklv- )                           ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;

;; Question 4

(define-struct string-wrapper (text))
;; A string-wrapper is a structure (make-string-wrapper s) where
;;   s is a string whose elements (characters) can only be one of
;;   (a) the underscore character "_"
;;   (b) the period character "."
;;   (c) the 26 lower-case Latin alphabet characters "a", "b", "c",
;;       ..., "x", "y", "z"

(define message (make-string-wrapper "hello._goodbye."))
(define message1 (make-string-wrapper "wklvbzdvbdqqr.lqjb_c_"))
(define message2 (make-string-wrapper "this_was_annoying_x.x"))
(define after-assignment (make-string-wrapper "zzzzzzzzzzzzzzz"))


;; (Part A)

;; caesar-encrypt: (void)
;; Purpose: This function consumes a string wrapper,m, and produces void.
;; Effects: 
;; The function encrypts a string-wrapper messsage,m, using a caesar cipher
;; and produces the string of the encrypted message.
;; Examples:
;;
;; where message is (make-string-wrapper "hello._goodbye.") calling the 
;; function (caesar-encrypt message) produces "khoorcbjrrge.hc" where each
;; letter of the original string is moved 3 characters forward in the alphabet
;; with "_" and "." counted on the end of the alphabet.
;;
(define (caesar-encrypt m)
  (local
    [(define (encrypter msg)
       (list->string
        (map (lambda (c) 
               (cond
                 [(= (char->integer c) 120)
                  (integer->char 95)]
                 [(= (char->integer c) 121)
                  (integer->char 46)]
                 [(= (char->integer c) 122)
                  (integer->char 97)]
                 [(= (char->integer c) 95)
                  (integer->char 98)]
                 [(= (char->integer c) 46)
                  (integer->char 99)]
                 [else (integer->char (+ 3 (char->integer c)))]))
             (string->list msg))))]
;    (set-string-wrapper-text! m (encrypter (string-wrapper-text m)
    (set! message (make-string-wrapper (encrypter (string-wrapper-text message))))))
;; Test cases for caesar-encrypt:
(check-expect
 (begin 
   (caesar-encrypt message)
   (equal? (string-wrapper-text message)
           "khoorcbjrrge.hc"))
true)



;; (Part B)

;; caesar-decrypt: string-wrapper-> void
;; Purpose: This function consumes a string wrapper,m, and produces void.
;; Effects: 
;; The function decrypts a string-wrapper messsage,c, using a caesar cipher
;; and produces the string of the decrypted message.
;; Examples:
;;
;; where message1 is (make-string-wrapper "wklvbzdvbdqqr.lqjb_c_") calling the 
;; function (caesar-decrypt message1) produces "this_was_annoying_x.x" where each
;; letter of the original string is moved 3 characters back in the alphabet
;; with "_" and "." counted on the end of the alphabet.
;;
(define (caesar-decrypt c)
  (local
    [(define (decrypter msg)
       (list->string
        (map
         (lambda (c) 
           (cond
             [(= (char->integer c) 95)
              (integer->char 120)]
             [(= (char->integer c) 46)
              (integer->char 121)]
             [(= (char->integer c) 97)
              (integer->char 122)]
             [(= (char->integer c) 98)
              (integer->char 95)]
             [(= (char->integer c) 99)
              (integer->char 46)]
             [else (integer->char (- (char->integer c) 3))]))
         (string->list msg))))]
    (set-string-wrapper-text! c (decrypter (string-wrapper-text c)))))
(check-expect
 (begin 
   (caesar-decrypt message1)
   (equal? (string-wrapper-text message1)
           "this_was_annoying_x.x"))
true)
(check-expect
 (begin
   (caesar-encrypt after-assignment)
   (caesar-decrypt after-assignment)
   (equal? (string-wrapper-text after-assignment)
           "zzzzzzzzzzzzzzz"))
 true)


do we make it general or do we do it only for message?