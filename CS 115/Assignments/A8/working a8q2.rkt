;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |working a8q2|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))

;; Question 2


;(define (my-compound-fun c)
; ....(compound-name c)...
;...(my-lop-fun (compound-lop c))..)

;(define (my-part-fun p)
; ...(part-size p)...
;(cond
; [(element? (part-eoc p))...(my-element-fun (part-eoc p))..]
;[(compound? (part-eoc p))...(my-compound-fun (part-eoc p))..]))

;(define (my-lop-fun l)
; (cond
;  [(empty? l)..]
; [else .. (my-part-fun (first l))..
;      ...(my-lop-fun (rest l))...]))


(define (is-organic? c) 
  (elements (compound-lop c)))


(define (elements lop)
  (cond
    [(empty? lop) false]
    [(any-carbon? (first lop)) true]
    [else (elements (rest lop))]))

(define (any-carbon? p)
  (cond
    [(element? (part-eoc p)) (carbon? (part-eoc p))]
    [(compound? (part-eoc p)) (is-organic? (part-eoc p))]))

(define (carbon? e)
  (equal? 'C (element-name e)))

;(define (desired-element? sym e)
; (equal? sym (element-name e)))

;(define (my-element-fun e)
;...(element-name e)...
;...(element-mmass e)..)

(is-organic? calcium-phosphate)