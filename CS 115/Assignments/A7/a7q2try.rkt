;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a7q2try) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))

(define (num-kids tanc)
  (cond [(t-modern? tanc) (t-modern-pop tanc)]
        [(t-ancient? tanc)
         (+ (num-kids (t-ancient-right tanc))
            (num-kids (t-ancient-left tanc)))]))

(define (most-pop-parent evol-tree)
  (cond [(t-modern? evol-tree) false]
        [(t-ancient? evol-tree) 
         (max (num-kids (t-ancient-left evol-tree))
              (num-kids (t-ancient-right evol-tree)))]))

(define (compare-pop tanc)
  (cond [(t-modern? tanc) false]
        [(t-ancient? tanc) 
         (max (num-kids (t-ancient-left tanc))
              (num-kids (t-ancient-right tanc)))]))

(compare-pop animal)

(define (parents taxn)
  [(t-modern? taxn) empty]
  [(and (t-modern? (t-ancient-left taxn))
        (t-modern? (t-ancient-right taxn)))(list taxn empty)]
  [(t-modern? taxn)
   
   
   
   (and (= (num-kids (t-ancient-left evol-tree)) populn)
                 (t-modern? (t-ancient-right evol-tree)))
            (t-ancient-name evol-tree)]
           [(and 
             (t-ancient?
              (t-ancient-left
               (t-ancient-left evol-tree)))