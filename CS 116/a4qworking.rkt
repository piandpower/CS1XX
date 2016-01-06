;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a4qworking) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
(define (split-list lst so-far)
       (cond
         [(empty? (rest lst)) (append so-far (list (list (first lst))))]
         [else (split-list (rest lst) (append so-far (list lst)))]))

(split-list (list 1 2 3 4) empty)

(

 ;;lon will be rest, n will be first
(define (counter lon n ct)
  (cond
    [(empty? (lon)) (add1 ct)]
    [(< n (first lon)) (add1 ct)]
    [else (counter (rest lon) n (add1 ct))]))

(define (comp-counter llon num)
  (cond
    [(empty? llon) num]
    [else (comp-counter (rest llon) (+ num
                                       (counter (rest (first llon))
                                                (first (first llon))
                                                0)))]))


(split-list alon empty)