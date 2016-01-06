;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ?a4help?) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))

"alert, chris"


(define (find-comma str)
  (cond 
    [(not (member #\, (string->list str))) "no comma"]
    [(equal? #\, (first (rest (string->list str)))) 2]
    [else (+ 1 (find-comma (list->string (rest(string->list str)))))]))

; (cond 
;      [else (+ 1 (find-comma (rest (string->list str))))])]))
;[else (+ 1 (find-comma (rest (string->list str))))])]))


(find-comma "alert, chris")


(substring str 0 (- (find-comma str) 1))