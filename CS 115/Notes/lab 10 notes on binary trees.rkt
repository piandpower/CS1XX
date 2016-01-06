;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |lab 10 notes on binary trees|) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;Lab 10: 

;;taxon either t-modern or t-ancient

;; ancient- age
;;modern- population


;speciate: taxon string string string num [>0, <1] -> taxon

;fun= speciate

;; create a fn that will take in a taxon and produce the name of the two t-moderns and a number p which represents the proportion of t-moderns that will speciate int new t-moderns


;; t- tree searching
;n1 name of searching
;;n2 n3 name of branches 
;; p -proportion


;(define (fun t n1 n2 n3 p)
  ;(cond [(t-modern? t) ....]
        ;......(t-modern-name t)....
        ;......(t-modern-pop t).....
        ;[t-ancient? t....
        ;......(t-ancient-name t)....
        ;......(t-ancient-age t).....
       ; ....(fun (t-ancient-left t))...
      ;  ....(fun (t-ancient-right t))...]))

(define (speciate t n1 n2 n3 p)
  (cond [(and (t-modern? t) (equal? n1 (t-modern-name t)))
         (make-t-ancient (t-modern-name t) ;name
                         0 ;age
                         (make-t-modern n2 (* p (t-modern-pop t)))
                         (make-t-modern n3 (* (- 1 p) (t-modern-pop t))))]
        [(t-modern? t) t]
        [(t-ancient? )
         (make-t-ancient
          (t-ancient-name t)
          (t-ancient-age t)
          (speciate (t-ancient-left t) n1 n2 n3 p)
          (speciate (t-ancient-right t) n1 n2 n3 p))]))


;;partial bae template
;(define (split-prod even num)
;  (cond
 ;   [(number? even) (make-bae 
  ;                   '* 
   ;                  (max-pwr2-factor even 2) 
    ;                 (/ even (max-pwr2-factor even 2)))]
    ;[(bae? even)..(bae-fn ex)..
     ;         ...(split-prod (bae-arg1 ..))...
      ;        ...(split-prod (bae-arg2 ..))...]))
                         