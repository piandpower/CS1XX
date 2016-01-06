;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a4q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;
;;********************************************************;;
;; CS 116 Assignment 4, Question 3                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Decoding a run-length encoded string of DNA)           ;;
;;                                                        ;;
;;                                                        ;;
;;                                                        ;;
;;********************************************************;;
;;



;; Question 3:

;; rle-decode: string -> string
;; Consumes a string,rle , representing the run-length encoding of a
;; string of DNA and produces the decoded string.
;; Examples:
;; (rle-decode "A2G1C3T2A10") =>"AAGCCCTTAAAAAAAAAA"
;; (rle-decode "A2G2T2C2") =>"AAGGTTCC"
;; (rle-decode "") => ""
;;
(define (rle-decode rle)
  (local
    [;; length-finder: string nat nat (listof nat) nat-> (listof nat)
     ;; Consumes a string ,str, three natural numbers, pt1,pt2 and 
     ;; acc-num and a list of natural numbers, length-list and produces
     ;; the number of each type of DNA character at each point in the 
     ;; string makes up the decoded DNA string.     
     (define (length-finder str pt1 pt2 length-list acc-num)
       (cond
         [(and (equal? pt2 (string-length str))
               (number? (string->number (substring str pt1 pt2))))
          (append length-list
                  (list (+ (string->number (substring str pt1 pt2))
                                       (* 10 acc-num))))]
         [(not (number? (string->number (substring str pt1 pt2))))
          (length-finder str (add1 pt1) (add1 pt2) (append length-list
                                                           (list acc-num)) 0)]
         [(number? (string->number (substring str pt1 pt2)))
          (length-finder str (add1 pt1) (add1 pt2) length-list
                         (+ (* acc-num 10)
                            (string->number (substring str pt1 pt2))))]))
     ;; dna-decoder: string (listof nat) string-> string
     ;; Consumes a string, dna-string, a list of natural numbers
     ;; l-list and a string, result-so-far and produces the decoded
     ;; run-length modelling of the DNA string represented by dna-string.
     (define (dna-decoder dna-string l-list result-so-far)
       (cond
         [(empty? l-list) result-so-far]
         [else 
          (dna-decoder
           (substring dna-string 2)
           (rest l-list)
           (string-append  result-so-far
                           (make-string (first l-list)
                                        (string-ref dna-string 0))))]))]
    (cond
      [(equal? "" rle) ""]
      [else (dna-decoder rle (filter 
                      (lambda (x) (not (zero? x)))
                      (length-finder (substring rle 1) 0 1 empty 0)) "")])))
;; Tests:
(check-expect (rle-decode "A2G1C3T2A10")
              "AAGCCCTTAAAAAAAAAA")
(check-expect (rle-decode "A5")
              "AAAAA")
(check-expect (rle-decode "G55")
              "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG")
(check-expect (rle-decode "C7")
              "CCCCCCC")
(check-expect (rle-decode "") "")
(check-expect (rle-decode "A2G2T2C2")
              "AAGGTTCC")
