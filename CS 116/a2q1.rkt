;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a2q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;********************************************
;; CS 115 Assignment 2, Question 1
;; Christopher Alert
;;
;;(Evaluating monthly charge for Online gaming
;; Membership)
;;
;;********************************************


;; Question 1

;;Online gaming membership

;;basic-chrge: int[>= 0] -> int[>= 0]
;;produces the charge for basic membership
;; based on games-played.
;;Examples: (basic-chrge 5)=> 10
;;(basic-chrge 60)=>15
 (define (basic-chrge games-played)
   (+ 10
      (cond [(<= games-played 50) 0]
            [(< 50 games-played) (* (- games-played 50) 0.5)])))
 ;;Tests
 ;;Less than 50 games
 (check-expect (basic-chrge 45) 10)
 ;;More than 50 games
 (check-expect (basic-chrge 51) 10.5)
                      
;;enhan-chrge: int[>= 0] -> int[>= 0]
;;produces the charge for enhanced membership
;; based on games-played.
;;Examples: (enhan-chrge 5)=> 15
;;(enhan-chrge 70)=>16.25
  (define (enhan-chrge games-played)
   (+ 15
      (cond [(<= games-played 75) 0]
            [(< 75 games-played) (* (- games-played 75) .25)])))
  ;;Tests
;;Less than 75 games
(check-expect (enhan-chrge 74) 15)
;;More than 75 games
(check-expect (enhan-chrge 76) 15.25)
;;No games played
(check-expect (enhan-chrge 0) 15)
      
;;prem-chrge: int[>= 0] -> int[>= 0]
;;produces the charge for premuim membership
;; based on games-played.
;;Examples: (prem-chrge 5)=> 22.5
;;(prem-chrge 10876)=>25
 (define (prem-chrge games-played)
   (cond [(< games-played 100) (- 25 (* 25 .1))]
         [(<= 100 games-played) 25])
   )
   ;;Tests
;;Less than 75 games
(check-expect (prem-chrge 100) 25)
;;More than 75 games
(check-expect (prem-chrge 99) 22.5)
 
;; monthly-fees: symbol nat-> num[> 0]
;; Produces the monthly fee charged to members of the online
;; gaming site based on membership type type and number of
 ;;games played during the month.
;;Examples: (monthly-fees 'Basic 40)=>10
 ;;(monthly-fees 'Enhanced 50)=> 15
 ;;(monthly-fees 'Premium 100)=> 25
(define (monthly-fees type games-played)
  (cond [(equal? type 'Basic) (basic-chrge games-played)]
        [(equal? type 'Enhanced) (enhan-chrge games-played)]
        [(equal? type 'Premium) (prem-chrge games-played)]
        ))
;;Tests
;;Basic Less than 50 games
 (check-expect (monthly-fees 'Basic 1) 10)
;;Basic More than 50 games
 (check-expect (monthly-fees 'Basic 60) 15)
;;Basic zero games
  (check-expect (monthly-fees 'Basic 0) 10)
;;Enhanced less than 75 games
 (check-expect (monthly-fees 'Enhanced 1) 15)
;;Enhanced More than 75 games
 (check-expect (monthly-fees 'Enhanced 100) 21.25)
;;Enhanced, zero games
 (check-expect (monthly-fees 'Enhanced 0) 15)
;;Premium less than 100 games
  (check-expect (monthly-fees 'Premium 5) 22.5)
;;Premium More than 100 games
  (check-expect (monthly-fees 'Premium 3000) 25)
;;Premium zero games  
  (check-expect (monthly-fees 'Premium 0) 22.5)
         
         

      
      