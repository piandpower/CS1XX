;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l3q6) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(define chrge-p-clip 100)
(define rate-p-m 100)





(define (film-choice num-clips length breakpoint1 discount1 breakpoint2 discount2)
  (+ (cond [ (< num-clips breakpoint1) (* num-clips chrge-p-clip)]
           [ (> num-clips breakpoint1) (* (* num-clips chrge-p-clip) discount1)]
           [ (> num-clips breakpoint2) (* (* num-clips chrge-p-clip discount2))])
     (* rate-p-m length)))

(film-choice 10 30 5 .25 8 .5)