;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a7q1) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 7, Question 1                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Creating a new binary arithmetic expression replacing  ;;
;; integer even numbers with the binary arithmetic        ;;
;; expression of the product of its highest factor of two);;
;;                                                        ;;
;;********************************************************;;

;; Question 1

(define-struct bae (fn arg1 arg2))
;; A binary arithmetic expression (binexp) is a number, or 
;; a structure (make-bae f a1 a2) where f is one of the 
;; symbols '+,'-,'*,'/, and a1 and a2 are binexp

;;max-pwr2pfactor: num int->int
;;Consumes a number, even, and produces either 0 if 0 consumed,
;; the number if the number isn't even, and if even, the largest
;; factor of even that can be expressed as a power of two.
;;Examples:
;;(max-pwr2-factor 55 2)=> 55
;;(max-pwr2-factor 0 2)=> 0
;;(max-pwr2-factor 40 2)=> 8
;;(max-pwr2-factor 30 2)=> 2
(define (max-pwr2-factor even num)
  (cond [(or (= even 0)
             (not (even? even))) even]
        [(not (equal? (remainder even num) 0)) (/ num 2)]
        [else (max-pwr2-factor even (* num 2))]))
;;Tests:
(check-expect (max-pwr2-factor 55 2) 55)
(check-expect (max-pwr2-factor 0 2) 0)
(check-expect (max-pwr2-factor 40 2) 8)
(check-expect (max-pwr2-factor 30 2) 2) 

;;factor-power2: binexp-> binexp
;;Consumes expr, and produces the binexp with all occurences of
;;even numbers replaced with a binexp of the product of the highest
;; power of two factor and the quotient of that number and the original
;;even.
;;Examples:
;;(factor-power2 (make-bae '+ 0 11.1))=>(make-bae '+ 0 11.1)
;;(factor-power2 (make-bae '+ 0 7))=>(make-bae '+ 0 7)
;;(factor-power2 40)=> (make-bae '* 8 5))
;;(factor-power2 2)=> (make-bae '* 2 1)
;;(factor-power2 (make-bae '+ 
;;                         (make-bae '- 12 22) 
;;                         (make-bae '/ 9 -48)))
;;=>(make-bae 
;;   '+
;;   (make-bae '- (make-bae '* 4 3) (make-bae '* 2 11))
;;   (make-bae '/ 9 (make-bae '* 16 -3))))
(define (factor-power2 expr)
  (cond
    [(and (integer? expr) (not (even? expr))) expr]
    [(and (integer? expr) (= expr 0)) 0] 
    [(and (integer? expr) (equal? (remainder expr 2) 0))
     (make-bae 
      '* 
      (max-pwr2-factor expr 2) 
      (/ expr (max-pwr2-factor expr 2)))]
    [(and (number? expr)
          (not (integer? expr))) expr]
    [(bae? expr) (make-bae (bae-fn expr)
                           (factor-power2 (bae-arg1 expr))
                           (factor-power2 (bae-arg2 expr)))]))
;;Tests:
(check-expect (factor-power2 (make-bae '+ 0 11.1))
              (make-bae '+ 0 11.1))
(check-expect (factor-power2 (make-bae '+ 0 7))
              (make-bae '+ 0 7))
(check-expect (factor-power2 40) (make-bae '* 8 5))
(check-expect (factor-power2 2) (make-bae '* 2 1))
(check-expect (factor-power2 (make-bae '+ 
                                       (make-bae '- 12 22) 
                                       (make-bae '/ 9 -48)))
              (make-bae 
               '+
               (make-bae '- (make-bae '* 4 3) (make-bae '* 2 11))
               (make-bae '/ 9 (make-bae '* 16 -3))))



