;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |idk pt 1|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))


(define (within-acc (close-ones remaining)
                    (cond
                      [(empty? remaining') close-ones]
                      [(< (distance (first remaining)) radius)
                       (wthin-acc (cons(first remaining) close-ones)
                                  (rest remaining))]
                      [else (within-acc close-ones (rest remaining))])))
                       
                       
                       ;;goin thru a list of posns to see which are w/in the radius one by one.
                       ;; call within-acc to produce the filtered list
                      (within-acc empty points)
                       
                       
                       ;;test: bigger, smaller, same size, ...