;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |a31. help.2|) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(cond [(or (symbol=? 'infinity (gradient m n)) 
           (symbol=? 'infinity (gradient n o))) (or (= 0 (gradient m n))
                                                    (= 0 (gradient n o)))]
       
      (define (square? a b c d) (and (cond [(symbol? (gradient a b)) (= 0 (gradient b c))]
                                           [(symbol? (gradient b c)) (= 0 (gradient a b))]
                                           [(and (number? (gradient a b)) (number? (gradient b c))) 
                                                 (= (gradient a b) (* -1 (gradient b c)))]          
                                  (= (posn-length a b) 
                                  (posn-length b c) 
                                  (posn-length c d)
                                  (posn-length d a)))))