;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a7q2) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 7, Question 2                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the parent with the most numerous offspring;;
;; from within the evolutionary tree)                     ;;
;;                                                        ;;
;;********************************************************;;


;(define (fun t)
;(cond [(t-modern? t) ....]
;......(t-modern-name t)....
;......(t-modern-pop t).....
;[t-ancient? t....
;......(t-ancient-name t)....
;......(t-ancient-age t).....
; ....(fun (t-ancient-left t))...
;  ....(fun (t-ancient-right t))...]))

;; Question 2
(define (most-populous-parent evol-tree)
  ...)

;(define (fun t)
; (cond [(t-modern? t)
;      ......(t-modern-name t)....
;     ......(t-modern-pop t).....]
;    [(t-ancient? t)
;    ......(t-ancient-name t)....
;   ......(t-ancient-age t).....
;  ....(fun (t-ancient-left t))...
; ....(fun (t-ancient-right t))...]))

(define (num-kids tanc)
  (cond [(t-modern? tanc) (t-modern-pop tanc)]
        [(t-ancient? tanc)
         (+ (num-kids (t-ancient-right tanc))
            (num-kids (t-ancient-left tanc)))]))

(define (most-pop evol-tree)
  (cond [(t-modern? evol-tree) (t-modern-pop evol-tree)]
        [(t-ancient? evol-tree) 
         (max (most-pop (t-ancient-left evol-tree))
              (most-pop (t-ancient-right evol-tree)))]))


(define (find-rent evol-tree populn)
  (cond [(t-modern? evol-tree) false]
        [(t-ancient? evol-tree)
         (cond 
           [(and (= (most-pop (t-ancient-right evol-tree)) populn)
                 (t-modern? (t-ancient-right evol-tree)))
            (t-ancient-name evol-tree)]
           [(and (= (num-kids (t-ancient-right evol-tree)) populn)
                 (t-ancient? (t-ancient-right evol-tree)))
            (t-ancient-name (t-ancient-right evol-tree))]
           [(and (= (num-kids (t-ancient-left evol-tree)) populn)
                 (t-modern? (t-ancient-right evol-tree)))
            (t-ancient-name evol-tree)]
           [(and 
             (t-ancient?
               (t-ancient-left evol-tree))
            (= (num-kids (t-ancient-left evol-tree)) populn))   
            (t-ancient-name
              (t-ancient-left evol-tree))]
           [(and 
             (t-ancient? evol-tree)
            (= (num-kids (t-ancient-left evol-tree)) populn))   
            (t-ancient-name evol-tree)]
           [else (find-parent (t-ancient-left evol-tree) populn)])]))



(define (compare-pop tanc)
  (cond [(t-modern? tanc) false]
        [(t-ancient? tanc) 
         (max (num-kids (t-ancient-left tanc))
              (num-kids (t-ancient-right tanc)))]))



;;find-parent: taxon num->   
(define (find-parent evol-tree populn)
  (cond [(t-modern? evol-tree) false]
        [(t-ancient? evol-tree)
         (cond 
           [(and (= (num-kids (t-ancient-right evol-tree)) populn)
                 (t-modern? (t-ancient-right evol-tree)))
            (t-ancient-name evol-tree)]
           [(and (= (num-kids (t-ancient-right evol-tree)) populn)
                 (t-ancient? (t-ancient-right evol-tree)))
            (t-ancient-name (t-ancient-right evol-tree))]
           [(and (= (num-kids (t-ancient-left evol-tree)) populn)
                 (t-modern? (t-ancient-right evol-tree)))
            (t-ancient-name evol-tree)]
           [(and 
             (t-ancient?
               (t-ancient-left evol-tree))
            (= (num-kids (t-ancient-left evol-tree)) populn))   
            (t-ancient-name
              (t-ancient-left evol-tree))]
           [(and 
             (t-ancient? evol-tree)
            (= (num-kids (t-ancient-left evol-tree)) populn))   
            (t-ancient-name evol-tree)]
           [else (find-parent (t-ancient-left evol-tree) populn)])]))
;;Tests:
(find-parent human (compare-pop human))
(find-parent primate (compare-pop primate))
(find-parent animal (compare-pop animal))
(find-parent mammal (compare-pop animal))
(find-parent vertebrate (compare-pop animal))
