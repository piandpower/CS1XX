;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |a5q4 working|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
(define (encrypter m)
  (list->string
   (map
    (lambda (c) 
      (cond
        [(= (char->integer c) 120)
         (integer->char 95)]
        [(= (char->integer c) 121)
         (integer->char 46)]
        [(= (char->integer c) 122)
         (integer->char 97)]
        [(= (char->integer c) 95)
         (integer->char 98)]
        [(= (char->integer c) 46)
         (integer->char 99)]
        [else (integer->char (+ 3 (char->integer c)))]))
    (string->list m))))

(encrypter "hello._goodbye.")