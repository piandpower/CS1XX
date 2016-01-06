;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a3help.1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(cond [(and (number? (gradient a b)) 
            (number? (gradient c d))
            (number? (gradient b c))
            (number? (gradient a d)))
       (or (= (gradient a b)
              (gradient c d)) 
           (= (gradient b c)
              (gradient a d)))]
      [(symbol? (gradient a b))
       (or (symbol? (gradient c d))
           (= (gradient b c)
              (gradient a d)))]
     [(symbol? (gradient b c))
      (or (symbol? (gradient a d))
          (= (gradient a b)
             (gradient c d)))]