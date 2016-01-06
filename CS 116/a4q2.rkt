;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a4q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 4, Question 2                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Encoding a dna-string into run-length encoding form)   ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;



;; Question 2: 

;; rle-encode: string -> string
;; Consumes a string,dna, representing a string of DNA and
;; produces the unique encoded string in run-length encoding form.
;; Examples:
;; (rle-encode "AAGCCCTTAAAAAAAAAA") =>"A2G1C3T2A10"
;; (rle-encode "AAGGTTCC") =>"A2G2T2C2"
;; (rle-encode "") => ""
;;
(define (rle-encode dna)
  (local
    [;; pattern-length: string nat nat (listof nat)-> (listof nat)
     ;; Consumes a string, str, two natural numbers, pt1, pt2 and 
     ;; a list of natural numbers and produces the list of the lengths
     ;; of consecutive repeated characters in a string.
     (define (pattern-length str pt1 pt2 lengths)
       (cond
         [(equal? pt2 (string-length str)) (append lengths (list pt2))]
         [(not (equal? (substring str pt1 pt2)
                       (substring str pt2 (add1 pt2))))
          (pattern-length str (add1 pt1) (add1 pt2) (append lengths (list pt2)))]
         [(equal? (substring str pt1 pt2)
                  (substring str pt2 (add1 pt2)))
          (pattern-length str (add1 pt1) (add1 pt2) lengths)]))
     ;; encoder: string (listof nat) string-> string
     ;; Consumes a string, dna-string, a list of natural numbers
     ;; l-list and a string, result-so-far and produces the encoded
     ;; run-length modelling of the DNA string represented by dna-string.  
     (define (encoder dna-string length-list result-so-far)
       (cond
         [(= 2 (length length-list)) 
          (string-append
           result-so-far
           (substring dna-string (first length-list) (add1 (first length-list)))
           (number->string (- (second length-list) (first length-list))))]
         [else 
          (encoder
           dna-string 
           (rest length-list) 
           (string-append 
            result-so-far
            (substring dna-string (first length-list) (add1 (first length-list)))
            (number->string (- (second length-list) (first length-list)))))]))]
    (cond
      [(equal? "" dna) ""]
      [else (encoder dna (pattern-length dna 0 1 (list 0)) "")])))
;;Tests:
(check-expect (rle-encode "AAGCCCTTAAAAAAAAAA") "A2G1C3T2A10")
(check-expect (rle-encode "") "")
(check-expect (rle-encode "AAGGTTCC") "A2G2T2C2")
(check-expect (rle-encode "AAAAA")
              "A5")
(check-expect 
 (rle-encode "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG")
              "G55")
(check-expect (rle-encode "CCCCCCC")
              "C7")