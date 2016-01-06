;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname thankyouGod) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(define (comma? name)

(cond 
  [(empty? (rest(string->list name))) "no comma"]
  [(equal? #\, (first(string->list name))) true]
  [(not (equal? #\, (first(string->list name)))) (comma? (list->string(rest(string->list name))))]))
      
(comma? "chris, alert")
(comma? "chris alert")

(define (find-comma name)
  (cond [(equal? (comma? name) "no comma") "no comma"]
        [(equal? #\, (first(string->list name))) 2]
        [(not (equal? #\, (first(string->list name)))) (+ 1 (find-comma (list->string(rest(string->list name)))))]))
        
(find-comma "chris alert")
(find-comma "a, c")
(find-comma "alert, chris")




;(define (find-comma name)
  ;(cond
   ; [(empty? (rest((list->string (rest(string->list name))))
    ;[(equal? #\, (first (rest (string->list name)))) 2]
    ;[else (+ 1 (find-comma (list->string (rest(string->list name)))))]
     ; [(not #\, (string->list name))) "no comma"]))
(find-comma "Potter, H")