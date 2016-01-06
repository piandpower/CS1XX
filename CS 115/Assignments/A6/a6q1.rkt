;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a6q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;*********************************************************
;; CS 115 Assignment 6, Question 1
;; Christopher Alert
;;
;;(Calculating the amount of interest gained from Jake's 
;; investment banking strategy )
;;
;;*********************************************************

;;Question 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helper functions for Question 1 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define century-leap 400)
(define century-non-leap 100)
(define general-leap 4)

;;Student-defined Constants

(define leapyrsum 1000)
(define savingsrate 1.05)
(define evenyrsum 100)
(define chequeacctrate 1.02)

;; is-multiple?: nat nat -> boolean
;; produces true if m is a multiple of n, false othewise.
;; example: (is-multiple? 15 3) => true, 
;           (is-multiple? 8 3) => false
(define (is-multiple? m n)
  (zero? (remainder m n)))
(check-expect (is-multiple? 10 3) false)
(check-expect (is-multiple? 10 5) true)
(check-expect (is-multiple? 10 10) true)
(check-expect (is-multiple? 10 15) false)

;; is-leap-year?: nat -> boolean
;; produces true if yr is a leap year, and false otherwise.
;; note that a yr is a leap year if it is divisible by 4, 
;; unless it is divisible by 100 but not 400. Zero is not 
;; a leap year.
;; example: (is-leap-year 1900) => false 
;; (is-leap-year 2000) => true, (is-leap-year 2012) => true
(define (is-leap-year? yr)
  (cond
    [(zero? yr) false]
    [(is-multiple? yr century-leap) true]
    [(is-multiple? yr century-non-leap) false]
    [(is-multiple? yr general-leap) true]
    [else false]))
(check-expect (is-leap-year? 0) false)
(check-expect (is-leap-year? 1900) false)
(check-expect (is-leap-year? 2000) true)
(check-expect (is-leap-year? 2012) true)
(check-expect (is-leap-year? 2010) false)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;num-leap-yr: nat nat -> nat
;;Consumes two natural numbers start-yr and retire-yr,
;;and produces the number of leap years between them
;;Examples:
;;(num-leap-yr 2010 2025)=> 4
;;(num-leap-yr 2008 2008)=> 1
;;(num-leap-yr 2009 2009)=> 0
;;(num-leap-yr 2007 2009)=> 1
(define (num-leap-yr start-yr retire-yr)
  (cond 
    [(= start-yr retire-yr) 
     (cond [(is-leap-year? start-yr) 1]
           [else 0])]
    [(is-leap-year? start-yr) 
     (+ 1 (num-leap-yr (+ 1 start-yr) retire-yr))]
    [else (num-leap-yr (add1 start-yr) retire-yr)]))
;;Tests:
(check-expect (num-leap-yr 2010 2025) 4)
(check-expect (num-leap-yr 2008 2008) 1)
(check-expect (num-leap-yr 2009 2009) 0)
(check-expect (num-leap-yr 2005 2007) 0)

;;num-even-not-leap: nat nat -> nat
;;Consumes two natural numbers start-yr and retire-yr,
;;and produces the number of even-numbered years that
;; aren't leap years
;;Examples:
;;(num-even-not-leap 2010 2025)=> 4
;;(num-even-not-leap 2001 2003)=> 1
;;(num-even-not-leap 2008 2008)=> 0 
;;(num-even-not-leap 2009 2009)=> 0
(define (num-even-not-leap start-yr retire-yr)
  (cond 
    [(= retire-yr start-yr) 
     (cond [(and (is-multiple? start-yr 2)
                 (not (is-leap-year? start-yr))) 1]
           [else 0])]
    [(and (is-multiple? start-yr 2)
          (not (is-leap-year? start-yr)))
     (+ 1 (num-even-not-leap (add1 start-yr) retire-yr))]
    [else (num-even-not-leap (add1 start-yr) retire-yr)]))
;;Tests:
(check-expect (num-even-not-leap 2000 2010) 3)
(check-expect (num-even-not-leap 2010 2025) 4)
(check-expect (num-even-not-leap 2001 2003) 1)
(check-expect (num-even-not-leap 2008 2008) 0)
(check-expect (num-even-not-leap 2009 2009) 0)

;;total-invested: nat nat-> int
;;Consumes two natural number years, start-yr and retire-yr;
;;and produces the total amount of money the investment banker
;;deposited into his chequing and his savings accounts.
;;Examples:
;;(total-invested 2000 2010)=> 3300
;;(total-invested 2008 2008)=> 1000
;;(total-invested 2005 2006)=> 100
;;(total-invested 2009 2009)=> 0
(define (total-invested start-yr retire-yr)
  (+ (* (num-leap-yr start-yr retire-yr) 1000)
     (* (num-even-not-leap start-yr retire-yr) 100)))
;;Tests:
(check-expect (total-invested 2008 2008) 1000)
(check-expect (total-invested 2006 2010) 1200)
(check-expect (total-invested 2005 2006) 100)
(check-expect (total-invested 2000 2010) 3300)
(check-expect (total-invested 2003 2013) 3200)
(check-expect (total-invested 2010 2025) 4400)
(check-expect (total-invested 2009 2009) 0)


;;compound: num num-> num
;;Consumes a number bal which is the end of year balance 
;;on the related account (Sav/cheq) and produces the new
;;end f year balance with interest compounded.
;;Examples:
;;(compound 0 1)=> 0
;;(compound 100 1.05)=> 105
;;(compound 1000 1.02)=> 1020
(define (compound bal rate)
  (* bal rate))
;;Tests:
(check-expect (compound 1000 chequeacctrate) 1020)
(check-expect (compound 0 chequeacctrate) 0)
(check-expect (compound 100 chequeacctrate) 102)
(check-expect (compound 1000 savingsrate) 1050)
(check-expect (compound 100 savingsrate) 105)
(check-expect (compound 0 savingsrate) 0)

;;savingsacct: nat nat num-> num
;;Consumes two natural numbers start-yr and retire-yr and produces,
;;the balance on the account at the end of retire-yr if 1000 is added,
;;to the account every leap year, and interest compounded annually.
;;Examples:
;;(savingacct 2008 2008 0)=> 1050
;;(savingacct 2006 2010 0)=> 1157.625
;;(savingacct 2007 2007 0)=> 0
;;(savingacct 2003 2007 0)=> 0
(define (savingacct start-yr retire-yr bal)
  (cond
    [(= retire-yr start-yr) 
     (cond [(is-leap-year? start-yr) 
            (compound (+ 1000 bal) savingsrate)]
           [else (compound bal savingsrate)])]
    [(is-leap-year? start-yr)
     (savingacct (add1 start-yr) retire-yr (compound (+ 1000 bal) savingsrate))]
    [else (savingacct (add1 start-yr) retire-yr (compound bal savingsrate))]))
;;Tests:
(check-expect (savingacct 2007 2007 0) 0)
(check-expect (savingacct 2005 2007 0) 0)
(check-expect (savingacct 2008 2008 0) 1050)
(check-expect (savingacct 2006 2010 0) 1157.625)
(check-within 0.01 (savingacct 2003 2013 0) 4071.49)
(check-within 0.01 (savingacct 2010 2025 0) 6051.42)

;;chequingacct: nat nat num-> num
;;Consumes two natural numbers start-yr and retire-yr and produces,
;;the balance on the account at the end of retire-yr if 100 is added,
;;to the account every even year that isn't leap, and interest 
;;compounded annually.
;;Examples:
;;(chequingacct 2007 2007 0)=> 0
;;(chequingacct 2008 2008 0)=> 0
;;(chequingacct 2006 2010 0)=> 212.408032
;;(chequingacct 2005 2006 0)=> 102
(define (chequingacct start-yr retire-yr bal)
  (cond 
    [(= retire-yr start-yr) (cond [(and (is-multiple? start-yr 2) 
                                        (not (is-leap-year? start-yr)))
                                   (compound (+ 100 bal) chequeacctrate)]
                                  [else (compound bal chequeacctrate)])]
    [(and (is-multiple? start-yr 2)
          (not (is-leap-year? start-yr)))
     (chequingacct (add1 start-yr) retire-yr (compound (+ 100 bal) chequeacctrate))]
    [else (chequingacct (add1 start-yr) retire-yr (compound bal chequeacctrate))]
    ))
;;Tests:
(check-within 0.01 (chequingacct 2006 2010 0) 212.40)
(check-expect (chequingacct 2005 2006 0) 102)
(check-within 0.01 (chequingacct 2006 2012 0) 220.98)
(check-expect (chequingacct 2010 2025 0)
              489.511904065542310228888833294336)

;;cumulative-interest: nat nat-> num
;;Consumes two natural years, start-yr and end-yr and produces,
;;the amount of interest generated from the chequing and savings,
;;accounts of the investment banker in carrying out his strategy.
;;Examples:
;;(cumulative-interest 2008 2010)=> 159.625
;;(cumulative-interest 2003 2007)=> 219.54625
;;(cumulative-interest 2008 2010)=> 159.625
;;(cumulative-interest 2009 2010)=> 2
;;(cumulative-interest 2009 2009)=> 0
(define (cumulative-interest start-yr retire-yr)
  (- (+ (chequingacct start-yr retire-yr 0)
        (savingacct start-yr retire-yr 0))
     (total-invested start-yr retire-yr)))
;;Tests
(check-expect (cumulative-interest 2009 2009) 0)
(check-expect (cumulative-interest 2008 2008) 50)
(check-expect (cumulative-interest 2008 2010) 159.625)
(check-expect (cumulative-interest 2009 2010) 2)
(check-expect (cumulative-interest 2010 2025)
              2140.933770907381104784552895794336)
(check-expect (cumulative-interest 2003 2007) 219.54625)
