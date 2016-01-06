;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q3) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;*********************************************************
;; CS 115 Assignment 4, Question 3
;;
;; Christopher Alert
;;
;;(Swapping the order of a string of a person's first and 
;; last name)
;;
;;*********************************************************

;; Assignment 4, Question 3

;;Defined Constants
(define cvalert "Alert, Christopher")
(define tooyoung "Young, Too")
(define placebo "place bo")

;;comma?: string-> boolean
;;Consumes a string ,name, and produces either "no comma" if there
;; are no commas, or true if there is a comma in the string
;;Examples: (comma? "Potter, H")=>true
;;(comma? "P H")=>"no comma" 
(define (comma? name)
 (cond 
  [(empty? (rest(string->list name))) "no comma"]
  [(equal? #\, (first(string->list name))) true]
  [(not (equal? #\, (first(string->list name)))) (comma? (list->string(rest(string->list name))))]))
 ;;Tests:     
(check-expect (comma? "chris, alert") true)
(check-expect (comma? "chris alert") "no comma")
(check-expect (comma? cvalert) true)
(check-expect (comma? placebo) "no comma")

;;find-comma: string-> (union num string)
;;Consumes a string ,name, and produces either "no comma" if there
;; are no commas, or a number which represents one place past 
;; the position of the comma in the string.
;;Examples: (find-comma "Potter, H")=>8
;;(find-comma "P, H")=>3
(define (find-comma name)
  (cond [(equal? (comma? name) "no comma") "no comma"]
        [(equal? #\, (first(string->list name))) 2]
        [(not (equal? #\, (first(string->list name)))) (+ 1 (find-comma (list->string(rest(string->list name)))))]))
;;Tests:
(check-expect (find-comma placebo) "no comma")
(check-expect (find-comma "a, c") 3)
(check-expect (find-comma "alert, chris") 7)
(check-expect (find-comma "a c") "no comma")
(check-expect (find-comma "Hagi Georghe") "no comma")
(check-expect (find-comma cvalert) 7)
(check-expect (find-comma "alerticusrexasoarus, chris") 21)
(check-expect (find-comma "alert, christoppphercolumbiansailor") 7)
(check-expect (find-comma "P, H") 3)

;;swap-last-first: string -> string
;;Consumes a string ,name, with format: last name first, a comma
;; and the frist name aftr a space and produces the string of the
;;name with first name first and surname last after a space.
;;Examples: (swap-last-first "c, l"=>"l c"
;;(swap-last-first "c l"=>"no comma"
;;(swap-last-first "champions, league"=>"league champions"
(define (swap-last-first name)
  (cond [(equal? (find-comma name) "no comma") "no comma"]
        [else (string-append (substring name (find-comma name)) " " (substring name 0 (- (find-comma name) 2)))]))
;;Tests:
(check-expect (swap-last-first cvalert) "Christopher Alert")
(check-expect (swap-last-first tooyoung) "Too Young")
(check-expect (swap-last-first "Hundredpercent, Please") "Please Hundredpercent")
(check-expect (swap-last-first "Cockshutt, A") "A Cockshutt")
(check-expect (swap-last-first "C, A") "A C")
(check-expect (swap-last-first "Cockshutt A") "no comma")
(check-expect (swap-last-first placebo) "no comma")


