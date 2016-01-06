;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a4q3atemptfutile) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))



(define (swap-last-first name)
  (cond
    [(empty? name) (string append ""]
    [(string? name) (string-append (rest( reverse (string->list name))) (swap-last-first (substring name 0 (- (string-length name) 1))))]
    ))  ;<--  or can it.. wrong since you cant eliminate from back
  ;...)

     ;;to sum up all parts
     ;(string-append (f-name name) (space? name) (surname name))

;;(define (tryating name)
  ;;(cond [(string->list name)]
         
         
         ;; number of letters in name, space comma , number of letters in lastname
         ;; remove space and comma
         
         ;; define my remove -- tek 'im LBAR   to remove comma from the string -> list of the 
         ;;name then if no comma then "no comma"
         
         ;;
  (swap-last-first "alert, christopher")
  