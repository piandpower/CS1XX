;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |template for aexp|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
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



;(define (my-eval ex)
 ; (cond
  ;  [(number? ex) ex]
   ; [else
    ; (my-apply (ae-fn ex) (ae-args ex))]))

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


;; Question 4
(define (num-0-results ex) 
  ... )

(define (my-aexp-fun ex)
  (cond 
    [(number? ex)...]
    [(ae? ex) ...(ae-fun ex)...
              ...(my-aexplist-fun (ae-args ex))...]))

(define (my-aexplist-fun exlist)
  (cond
    [(empty? exlist)...]
    [(cons? exlist)...(my-aexp-fun (first exlist))...
                   ...(my-explist-fun (rest exlist))...]))

(define (my-eval ex)
  (cond
    [(number? ex) ex]
    [else
     (apply (ae-fn ex) (ae-args ex))]))

(