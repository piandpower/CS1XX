;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab11q2) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
(define-struct ae (fn args))
;; An arithmetic expression (aexp) is either a number, or a
;; structure (make-ae f alist) where f is a symbol and alist is
;; an aexplist.
;;
;; An aexplist is either empty or (cons a alist) where a is an
;; aexp and alist is an aexplist.
(define (num-0-results ex) 
  ... )

;(define (my-aexp-fun ex)
; (cond 
;  [(number? ex)...]
; [(ae? ex) ...(ae-fun ex)...
;          ...(my-aexplist-fun (ae-args ex))...]))

;(define (my-aexplist-fun exlist)
; (cond
;  [(empty? exlist)...]
; [(cons? exlist)...(my-aexp-fun (first exlist))...
;               ...(my-explist-fun (rest exlist))...]))

;(define (my-aexp-fun2 ex)
; (cond 
;  [(number? ex)...]
; [(cons? ex) ...(first ex)...
;          ...(my-aexplist-fun2 (ae-args ex))...]))

;(define (my-aexplist-fun2 exlist)
; (cond
;  [(empty? exlist)...]
; [(cons? exlist)...(my-aexp-fun2 (first exlist))...
;               ...(my-explist-fun2 (rest exlist))...]))



(define (my-eval ex x)
  (cond
    [(number? ex) ex]
    [(equal? 'x ex) x]
    [else
     (my-apply (ae-fn ex) (ae-args ex) x)]))

(define (my-apply f exlist x)
  (cond
    [(empty? exlist)
     (cond [(symbol=? f '*) 1]
           [(symbol=? f '+) 0])]
    [(cons? exlist)
     (cond
       [(and (symbol=? f '*) (equal? (my-eval (first exlist) x) 'x))
        (* x (my-apply f (rest exlist)) x)]
       [(and (symbol=? f '+) (equal? (my-eval (first exlist) x) 'x))
        (+ x (my-apply f (rest exlist) x))]
    [(symbol=? f '*)
     (* (my-eval (first exlist) x) (my-apply f (rest exlist) x))]
    [(symbol=? f '+)
     (+ (my-eval (first exlist) x) (my-apply f (rest exlist) x))])]))