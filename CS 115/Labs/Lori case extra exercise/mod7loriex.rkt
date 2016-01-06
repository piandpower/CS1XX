;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mod7loriex) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
(define-struct word-pair (str-one str-two))
;; A word-pair is a structure (make-word-pair s1 s2), 
;; where s1 and s2 are non-empty strings, and
;; the last letter in s1 is the same as the first letter
;; in s2.

;; build-word-pairs: (listof string) (listof string)
;;                   -> (listof word-pair)
;; produces a list of word pairs from one-source
;; and two-source, but finds the first entry in 
;; two-source which matches each entry in one-source.
;; Once a match for a word in one-source is found,
;; continue the search for the next word in one-source
;; from that point in two-source.
;; Note that not all words in one-source will have appear
;; as part of a word-pair in the produced value.
;; example: (build-word-pairs (list "abc" "def" "ghijkl")
;;   (list "horse" "cat" "goose" "gander" "frog"))
;; => (list (make-word-pair "abc" "cat")
;;          (make-word-pair "def" "frog"))

(define (build-word-pairs one-source two-source)
  (local
    [(define (suitable? str1 str2)
       (equal? (substring str1 (sub1 (string-length str1)))
               (substring str2 0 1)))]
    (cond
      [(and (empty? one-source) (empty? two-source)) empty]
      [(and (empty? one-source) (cons? two-source)) empty]
      [(and (cons? one-source) (empty? two-source)) empty]
      [(and (cons? one-source) (cons? two-source))
       (cond
         [(suitable? (first one-source) (first two-source))
          (cons
           (make-word-pair (first one-source) (first two-source))
           (build-word-pairs (rest one-source) (rest two-source)))]
         [else (build-word-pairs one-source (rest two-source))])])))

;; some test cases
(check-expect (build-word-pairs empty empty) empty)
(check-expect (build-word-pairs (list "abc")
                                (list "cat"))
              (list (make-word-pair "abc" "cat")))
(check-expect (build-word-pairs (list "abc")
                                (list "dog"))
              empty)
(check-expect 
 (build-word-pairs (list "abc" "def" "ghi" "jkl") 
                   (list "horse" "cat" "goose" "hippo" "frog" "monkey")) (list (make-word-pair "abc" "cat")
                                                                               (make-word-pair "def" "frog")))
(check-expect (build-word-pairs (list "abc" "def" "ghi" "jki")
                                (list "car" "frog" "insect"))
              (list (make-word-pair "abc" "car")
                    (make-word-pair "def" "frog")
                    (make-word-pair "ghi" "insect")))