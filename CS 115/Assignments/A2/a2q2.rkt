;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a2q2) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;************************************************
;; CS 115 Assignment 2, Question 2
;;
;; Christopher Alert
;;
;;(Creating a userid from a person's information )
;;
;;************************************************


;;Getting first initial
;; first-let: str -> str
;; Produces a string of the lower case first letter
;; of string first , that is, the person's first name
;; Example:(first-let "theo")=> "t"
;;         (first-let "charles")=> "c"
(define (first-let first)
  (cond
    [(< 0 (string-length first)) (substring first 0 1)]
    [else "error" ]))
;;Tests:
(check-expect (first-let "ayana") "a")
(check-expect (first-let "christopher") "c")
(check-expect (first-let "") "error") 

;;Getting middle initial
;; mid-let: str -> str
;; Produces a string of the lower case first letter
;; of string middle , that is, the person's middle name
;; Example:(mid-let "victor")=> "v"
;;         (mid-let "jim")=> "j"
(define (mid-let middle)
  (cond
    [(< 0 (string-length middle)) (substring middle 0 1)]
    [else "" ]))
;;Tests:
(check-expect (mid-let "lani") "l")
(check-expect (mid-let "nicole") "n")
(check-expect (mid-let "") "")

;;Getting index number
;; add-ind: nat -> str
;; Produces a string of the number index once it is not
;; 1 (one).
;; Example:(add-ind 1)=> ""
;;         (dd-int "2")=> "2"
(define (add-ind index)
  (cond [(= 1 index) ""]
        [else (number->string index)]))
;;Tests:
(check-expect (add-ind 4) "4")
(check-expect (add-ind 1) "")
(check-expect (add-ind 0) "0")
(check-expect (add-ind 45) "45")
(check-expect (add-ind 102) "102")

  

;; Getting surname
;; surnam: str str str num -> str
;; Produces a string of the lower case first letter
;; of string middle , that is, the person's middle name
;; Example:(surnam "chris" "" "alert" 4)=> "alert"
;;         (mid-let "jim")=> "j"
(define (surnam first middle last index)
  (cond
    [(>= 5 (string-length last)) (substring last 0)]
    [else (cond 
            [(= 3 (string-length(string-append (first-let first)
                                               (mid-let middle) 
                                               (add-ind index)))) 
             (substring last 0 5)]
            [(= 2 (string-length(string-append (first-let first) 
                                               (mid-let middle) 
                                               (add-ind index)))) 
             (substring last 0 6)]
            [(= 1 (string-length(string-append (first-let first)
                                               (mid-let middle) 
                                               (add-ind index)))) 
             (substring last 0 7)])])
    )
;;Tests:
;;with a middle name and an index not=1, surname shorter than 5
(check-expect (surnam "chris" "victor" "alert" 4) "alert")
;;With no middle name, index=1 and surname less than 5
(check-expect (surnam "chris" "" "alert" 1) "alert")
;;With middle name, surname longer than 5 and index not=1
(check-expect (surnam "chris" "voronin" "armstrong" 4) "armst")
;;With middle name, surname longer than 5 and index=1
(check-expect (surnam "chris" "voronin" "armstrong" 1) "armstr")
;;No middle name & index chosen=1, last name longer than 5
(check-expect (surnam "chris" "" "armstrong" 1) "armstro")


;; create-userid str str str num[not 1] -> str
;; Produces a username consisting of a person's
;; first initial, that is, the first letter of 
;; first, the first initial of middle (middle name)
;; if provided, a number, index if it is not 1, and
;; the last name
;;Examples:(create-userid "chris" "victor" "alert" 4)=> "cv4alert"
 (define (create-userid first middle last index)
   (string-append (first-let first)
                  (mid-let middle)
                  (add-ind index)
                  (surnam first middle last index)))
 ;;Tests:
  ;;with a middle name and an index not=1, surname shorter than 5
 (check-expect (create-userid "chris" "victor" "alert" 4) "cv4alert")
;;No middle name & index chosen=1, last name less than 5
 (check-expect (create-userid "chris" "" "alert" 4) "c4alert")
  ;;With no middle name, index=1 and surname less than 5
 (check-expect (create-userid "chris" "" "alert" 1) "calert")
 ;;With middle name, index=1, last name shorter than 5
 (check-expect (create-userid "chris" "victor" "alert" 1) "cvalert")
;;With middle name, surname longer than 5 and index not=1
(check-expect (create-userid "chris" "voronin" "armstrong" 4) "cv4armst")
;;No middle name & index chosen=1, last name longer than 5
(check-expect (create-userid "chris" "" "armstrong" 1) "carmstro")
;;With middle name, surname longer than 5 and index=1
(check-expect (create-userid "chris" "voronin" "armstrong" 1) "cvarmstr")

                  

 
   
   


   