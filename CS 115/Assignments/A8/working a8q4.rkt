;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |working a8q4|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))

;; eval on first 

;; apply <-- aexplist fn on rest

;; Question 4

(define-struct ae (fn args))
;; An arithmetic expression (aexp) is either a number, or a
;; structure (make-ae f alist) where f is a symbol and alist is
;; an aexplist.
;;
;; An aexplist is either empty or (cons a alist) where a is an
;; aexp and alist is an aexplist.


;;Defined Constants
(define myex1 (make-ae '+ (list 0 2 -2 3 1 -4 0)))
(define myex2 (make-ae '* (list 3 0 2 7)))
(define myex3 (make-ae '* (list myex1 3 0 2 7)))

(define (eval-zeros ex)                                                  ;(define (eval ex)
  (cond                                                                   ;(cond
    [(number? ex) (list ex 0)]        ;[(number? ex) ex]
    [else                                                                   ;[else
     (count-apply (ae-fn ex) (ae-args ex))]))                                        ;(my-apply (ae-fn ex) (ae-args ex))]))
;;Tests:
(check-expect (eval-zeros (make-ae '+ empty)) (list 0 0))
(check-expect (eval-zeros myex1) (list 0 4))
(check-expect (eval-zeros myex2) (list 0 2))
(check-expect (eval-zeros myex3) (list 0 7))

;;count-apply: symbol aexplist
(define (count-apply f exlist)                                                     ;(define (apply2 f exlist)
  (cond                                                                            ;(cond
    [(empty? exlist)                                                                    ;[(empty? exlist)
     (cond [(symbol=? f '*) (list 1 0)]                                                                 ;(cond [(symbol=? f '*) 1]
           [(symbol=? f '+) (list 0 0)])]                                                                      ;[(symbol=? f '+) 0])]
    [(cons? exlist)                                                                                   ;[(cons? exlist)
     (cond                                                                                         ;     (cond
       [(symbol=? f '*)                                                                               ;[(symbol=? f '*)
        (count-0 '* (eval-zeros (first exlist)) (count-apply f (rest exlist)))]                            ;(* (my-eval (first exlist)) (my-apply f (rest exlist)))]
       [(symbol=? f '+)
        (count-0 '+ (eval-zeros (first exlist)) (count-apply f (rest exlist)))])]))                  ;      (+ (my-eval (first exlist)) (my-apply f (rest exlist)))])]))

(define (count-0 operation result1 result2)
  (cond
    [(symbol=? '+ operation)
     (cond
       [(zero? (+ (first result1) (first result2))) 
        (list (+ (first result1) (first result2)) 
              (+ 1 (second result1) (second result2)))]
       [else (list (+ (first result1) (first result2)) 
                   (+ (second result1) (second result2)))])]
    [(symbol=? '* operation)
     (cond
       [(zero? (* (first result1) (first result2))) 
        (list (* (first result1) (first result2)) 
              (+ 1 (second result1) (second result2)))]
       [else (list (* (first result1) (first result2)) 
                   (+ (second result1) (second result2)))])]))

(define (num-0-results ex)
  (second (eval-zeros ex)))
;;Tests:
(check-expect (num-0-results myex1) 4)  
(check-expect (num-0-results myex2) 2)  
(check-expect (num-0-results myex3) 7)





;; An arithmetic expression (aexp) is either a number, or a
;; structure (make-ae f alist) where f is a symbol and alist is
;; an aexplist.
;;
;; An aexplist is either empty or (cons a alist) where a is an
;; aexp and alist is an aexplist.
;(define (num-0-results ex) 
; ... )

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


;(define (my-eval ex)
; (cond
;  [(number? ex) ex]
; [else
; (my-apply (ae-fn ex) (ae-args ex))]))

;;(define (count-0 ex)
;;(cond
;;   [(empty? (rest exlist))

;(define (my-apply f exlist)
; (cond
;  [(empty? exlist)
;  (cond [(symbol=? f '*) 1]
;       [(symbol=? f '+) 0])]
;[(cons? exlist)
;(cond
; [(symbol=? f '*)
; (* (my-eval (first exlist)) (my-apply f (rest exlist)))]
;[(symbol=? f '+)
;(+ (my-eval (first exlist)) (my-apply f (rest exlist)))])]))

;;num-0
;; ;(define (num-0 ex)
; (cond 
;  [(number? ex) 0]
; [(ae? ex) (cons (count (eval ex)
;          ...(my-aexplist-fun (ae-args ex))...]))

;(define (my-aexplist-fun exlist)
; (cond
;  [(empty? exlist)...]
; [(cons? exlist)...(my-aexp-fun (first exlist))...
;               ...(my-explist-fun (rest exlist))...]))