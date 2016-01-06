;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname notes1) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
(make-posn 3 2) ;; create one of these 
                ;; when run its repeated statment says "this posn exists with x vals & y vals.

(define point (make-posn 3 2))

(posn-x point)
(posn-y point)
;;(posn-x "hat")


;;(define make-struct 
  
  (define a (make-posn 1 3))
  
  ;;(make-posn x y)
  ;; x and y are the fields of the posn
  
  ;;(posn-TYPE FIELD)
  ;;(posn-type FIELD)     e.g field name could be string, num , etc 
  
  ;;(posn? posn)=> true      the parameter posn could be a defined posn name
  ;;(posn? num/str/symbol)=> false
  
  (define p1 (make-posn 3 4))
  (define p3 (make-posn 1 1))
  (define p2 (make-posn 0 0))
  
  (define (distance posn1 posn2)
            (sqrt (+ (sqr (- (posn-x posn1) (posn-x posn2)))
                     (sqr (- (posn-y posn1) (posn-y posn2))))))
  
  (check-expect (distance p1 p2) 5)
  ;;(check-expect (distance p3 p2) (sqrt 2)) <--doesnt work
  
  ;; note: check-expect cannot compare inexact numbers.
  
  ;;(scale A -5)
  
  (define p4 (make-posn 'goat 'eggs))
  
  (posn-x p4)
  
  ;;(distance p4 p1) <-- doesnt work cuz posn has a string instead of num
  
  ;;scheme usues dynamic typing 
  
  (define (safe-make-posn xcoord ycoord)
    (cond
    [(and (number? xcoord) (number? ycoord))
     (make-posn xcoord ycoord)]
    [else (error 'safe-make-posn )]))
  
  (define-struct iPod ( type memory colour))
  
  ;; automatically (make-iPod arg arg arg) is made
  ;; also  (iPod-type
  ;;       (iPod-memory
  ;;       (iPod-colour
  ;; also type predicate (iPod? any)
  
  (define loris (make-iPod 'nano 8 'gold))
  (define junk (make-iPod 89 "goat" "lol"))
  
  ;;(iPod-memory junk)= "junk"
  
  ;;exampple data definition
  
;;An iPod is a structure (make-iPod t m c), where
;; t is a symbol for the type of the iPod
;; (one of 'nano, 'shuffle, 'touch, 'classic)
;; m is a nat[>0]for the amount of memory measured in gigs
;; c is a symbol for the colour of the iPod
  
  '' strings more comparable
  
  
  Helpful tips
Highlighted unused code After you have run your program, any unused part of the code will be highlighted. This either means that you have parts of the code that are not needed (and should be removed) or that you need to add more tests.