;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a5q3att2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

(define P 1000000)
(define r .08)
(define W 100000)

;Compound int P(1+ r)^n


(define (compounded-P P years)
  (cond [(zero? years) P]
        [else (compounded-P (- (+ P (* r P)) W) (sub1 years))]))


;; Question 3
(define (balance n-years)
  (cond [(< (compounded-P P n-years) 0) 'Overdrawn]
        [else (compounded-P P n-years)]))
;;Tests:
(check-expect (balance 0)1000000)
(check-expect (balance 10) 710268.75068180332544)
(check-expect (balance 21) 'Overdrawn)