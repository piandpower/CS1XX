;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a4q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 4, Question 4                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining whether or not a string is a silly-string) ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;


;; Question 4:

;;Defined Constants

(define my-silly "baabbaccdddcccc")

;; silly-string?: string-> boolean
;; Consumes a string s, and produces true if s is a silly-string.
;; Examples:
;; (silly-string? "a")=> true
;; (silly-string? "bcc")=> true
;; (silly-string? "aabccddd")=> true
;; (silly-string? "aaabaadddcc")=> true
;; (silly-string? "abc")=> false
;; (silly-string? "bcca")=> false
;; (silly-string? "dddd")=> false
;; (silly-string? "aabccxddd")=> false
;; (silly-string? my-silly)=> true

(define (silly-string? s)
  (local
    [;; silly-skimmer: string
     ;; Consumes a string ,ss, and checks whether the string fits
     ;; the criteria required to be a silly-string.Produces true
     ;; if ss does, false otherwise.
     (define (silly-skimmer ss)
       (cond
         [(equal? "" ss) true]
         [(equal? "a" (substring ss 0 1))
          (silly-skimmer (substring ss 1))]
         [(and (equal? (substring ss 0 1) "b")
               (equal? (substring ss (- (string-length ss) 2)) "cc"))
          (silly-skimmer (substring ss 1 (- (string-length ss) 2)))]
         [(and
           (>= (string-length ss) 3)
           (equal? "ddd" (substring ss (- (string-length ss) 3))))
          (silly-skimmer (substring ss 0 (- (string-length ss) 3)))]
         [else false]))]
    (silly-skimmer s)))
;; Tests:
(check-expect (silly-string? "a") true)
(check-expect (silly-string? "bcc") true)
(check-expect (silly-string? "aabccddd") true)
(check-expect (silly-string? "aaabaadddcc") true)
(check-expect (silly-string? "abc") false)
(check-expect (silly-string? "bcca") false)
(check-expect (silly-string? "dddd") false)
(check-expect (silly-string? "aabccxddd") false)
(check-expect (silly-string? my-silly) true)
(check-expect (silly-string? "bacc") true)
 