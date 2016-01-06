;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Accumulatve Recursion Template|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks")))))
;;Template for Accumultive Recursion

(define (fn value ...)
  (local
    [ ;;define a helper funtion which generally has at least two parameters.
     ;; *one to get track of what remains to be done
     ''* one to rememberwhat hads been calculated so far.
         ;; note: more parameters may be needed , particularly 
         ;;more accumulators to remember more pieces of information.
         (define (acc-fn remaining acc-var)
           (cond
             
             ;;if nothinf remains to be done, return the answer 
             ;;often this is just acc-var itself,but sometimes
             ;;some calculation may be needed as well.
             [base-case? ....acc-var...]
             
             ;;otherwise, call acc-fn recursively, updating
             ;;the values for remaining and acc-var
             [else....(acc-fn updated-remaining
                              updated-acc-var ....)]))]
    
    ;;call th ehelper function with initial values of the
    ;;parameters.
    ;;Note that this may be more complicated as well, e.g.
    ;;if some special cases do not require the helper function
    ;;at all.
    (acc-fn initial-value-of-remaining
            initial-value-of-acc-var))
  
  ;;initial val of rem may be entire list or n
  ;;acc-var may be 0 , 1 , 1st val in list or a constant to start off with.
  
  ;HAND IN ALGEBRA ! --- do calc , PD , Econ , BU 