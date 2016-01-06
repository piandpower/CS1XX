;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |lec 7|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;duplicate-string
;;consumes string s and a nat num n
;;produces a string with n copies of s


(define (duplicate-string n s)
  (local
    [(define (n-strings strings-left strings-so-far)
       (cond [(= strings-left 1) (string-append strings-so-far s)]
             [else (n-strings (sub1 strings-left) (string-append strings-so-far s))]))]
    (n-strings n "")))

(duplicate-string 3 "CVA")

(define (dup-str s1 n1)
  (local
    [(define (dup-acc so-far n-more)
       (cond 
         [(zero? n-more) so-far]
         [else (dup-acc (string-append so-far s1)
                        (sub1 n-more))]))]
     (dup-acc "" n1)))
(dup-str "CVA" 3)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list-max l)
  (local
    [(define (max-of-list? max-so-far l)
       (cond
         [(empty? l) max-so-far]
         [else (max-of-list? (max max-so-far (first l)) (rest l))]))]
    (max-of-list? (first l) (rest l))))
(list-max '( 100 8 9 0))
(list-max '( 1 2 3 4 5 78 353 232424 8 9 0))
