;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a3q4) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")))))
;;******************************************************
;; CS 115 Assignment 3, Question 4
;; Christopher Alert
;;
;;(Determining where in the world a certain gps point is)
;;
;;******************************************************

;; Assignment 3 Question 4


(define-struct gps-point (lat long alt))
;;A gps­point is a structure(make­gps­point d1 d2 a) where
;;d1 is a real number representing a latitude position measured in degrees
;;d2 is a real number representing the longitude position measured in degrees, and
;; a is a real number representing an altitude measured in metres.

;;Defined Constant positions

(define barbados (make-gps-point 59 -32 13))
(define waterloo (make-gps-point 43 -80 13))

;;ocean?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at position is
;; at an altitude of less than or equal to zero degrees
;;Examples: (ocean? (make-gps-point 2 3 4))=>false
;;(ocean? (make-gps-point 2 3 -4))=>true
(define (ocean? position)
  (cond [(<= (gps-point-alt position) 0) true]
        [else false]))
;;Tests
(check-expect (ocean? (make-gps-point 2 3 0)) true)
(check-expect (ocean? (make-gps-point 2 3 -4)) true)
(check-expect (ocean? (make-gps-point 2 3 4)) false)

;;antarctica?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at position is
;; at an latitude of less than or equal to -60 degrees latitude
;;Examples: (antarctica? (make-gps-point 2 3 4))=>false
;;(antarctica? (make-gps-point -61 3 -4))=>true
(define (antarctica? position)
  (cond [(and (<= (gps-point-lat position) -60)
              (< (gps-point-long position) 180)
              (> (gps-point-long position) -180)) true]
        [else false]))
;;Tests
;;Within Antartican borders
(check-expect (antarctica? (make-gps-point -61 3 -4)) true)
;;On the Antarctican border
(check-expect (antarctica? (make-gps-point -60 3 -4)) true)
(check-expect (antarctica? (make-gps-point -60 179 -4)) true)
(check-expect (antarctica? (make-gps-point -60 -179 -4)) true)
;;Outside Antarctica
(check-expect (antarctica? (make-gps-point 2 3 4)) false)

;;australia?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at position is
;; at an latitude of less than or equal to -10 degrees latitude
;; but greater than -60 degrees latitude and east of and including
;; 110 degrees longitude
;;Examples: (australia? (make-gps-point -15 112 1000))=>true
;;(australia? (make-gps-point -6 110 -4))=>false
(define (australia? position)
  (cond [(and (<= (gps-point-lat position) -10) 
              (> (gps-point-lat position) -60)
              (>= (gps-point-long position) 110)) true]
        [else false]))
;;Tests
;;Within Australian territory
(check-expect (australia? (make-gps-point -15 112 1000)) true)
;;Outside Australian borders
(check-expect (australia? (make-gps-point -6 110 -4)) false)
;;Border of Australia
(check-expect (australia? (make-gps-point -10 110 -4)) true)
(check-expect (australia? (make-gps-point -59 110 -4)) true)
(check-expect (australia? (make-gps-point -10 115 -4)) true)

;;africa?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at position is
;; at an latitude of less than or equal to 37 degrees latitude
;; more than -60 degrees lat. and longitude greater or equal to
;;-10 degrees longitude and less than or equal to 63 degrees long.
;;Examples: (africa? (make-gps-point 32 63 1000))=>true   ;;change
;;(africa? (make-gps-point -6 110 -4))=>false
(define (africa? position)
  (cond [(and (<= (gps-point-lat position) 37)
              (> (gps-point-lat position) -60)
              (<= (gps-point-long position) 63)
              (>= (gps-point-long position) -10)) true]
        [else false]))
;;Tests
;;Within African territory
(check-expect (africa? (make-gps-point 33 30 1000)) true)
;;Outside African borders
(check-expect (africa? (make-gps-point 40 110 -40)) false)
(check-expect (africa? (make-gps-point 40 -12 -41)) false)
;;Borders of Africa
(check-expect (africa? (make-gps-point -59 63 -4)) true)
(check-expect (africa? (make-gps-point -59 -10 -4)) true)
(check-expect (africa? (make-gps-point 37 -10 -4)) true)
(check-expect (africa? (make-gps-point 37 63 -4)) true)


;;europe?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at position is
;; at a latitude of more than 37 degrees latitude and longitude
;; greater or equal to -28 degrees longitude and
;;  less than and including 68 degrees longitude.
;;Examples: (europe? (make-gps-point 60 28 1000))=>true   
;;(europe? (make-gps-point 36 69 -29))=>false
(define (europe? position)
  (cond [(and (> (gps-point-lat position) 37)
              (< (gps-point-lat position) 90)
              (<= (gps-point-long position) 68)
              (>= (gps-point-long position) -28)) true]
        [else false]))
;;Tests
;;Within European territory
(check-expect (europe? (make-gps-point 60 28 1000)) true)
;;Outside European borders
(check-expect (europe? (make-gps-point 36 69 -29)) false)
(check-expect (europe? (make-gps-point 36 -29 29)) false)
(check-expect (europe? (make-gps-point 40 69 -20)) false)
(check-expect (europe? (make-gps-point 40 -29 -20)) false)
;;Borders of Europe
(check-expect (europe? (make-gps-point 38 68 -4)) true)
(check-expect (europe? (make-gps-point 38 -28 -4)) true)
(check-expect (europe? (make-gps-point 89 68 -4)) true)
(check-expect (europe? (make-gps-point 89 -10 -4)) true)


;;namerica?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at position is
;; at a latitude of more than 5 degrees lat and less than 90 degrees
;; and longitude less than or equal to -28 degrees longitude and
;;  more than -180 degrees long.
;;Examples: (namerica? (make-gps-point 50 -40 1000))=>true   ;change 
;;(namerica? (make-gps-point 4 69 -29))=>false
(define (namerica? position)
  (cond [(or (and (>= (gps-point-lat position) 5)
              (< (gps-point-lat position) 90)
              (< (gps-point-long position) -28)
              (> (gps-point-long position) -180))
           (and (< (gps-point-lat position) 37)
                (>= (gps-point-lat position) 5)
                (>= (gps-point-long position) -28)
                (<= (gps-point-long position) -10)))
               true]
        [else false]))
;;Tests
;;Within North American territory
(check-expect (namerica? (make-gps-point 10 -30 1000)) true)
(check-expect (namerica? (make-gps-point 5 -27 29)) true)
;;Outside North American borders
(check-expect (namerica? (make-gps-point 4 69 -29)) false)
(check-expect (namerica? (make-gps-point 5 67 -20)) false)
(check-expect (namerica? (make-gps-point 4 -27 -20)) false)
(check-expect (namerica? (make-gps-point 4 67 -20)) false)
;;Borders of North America
(check-expect (namerica? (make-gps-point 5 -29 -4)) true)
(check-expect (namerica? (make-gps-point 89 -179 -4)) true)
(check-expect (namerica? (make-gps-point 5 -11 -4)) true)
(check-expect (namerica? (make-gps-point 36 -12 -4)) true)


;;samerica?: gps-point -> boolean
;;Produces a boolean of true if the gps-point at ,position, is
;; at a latitude of more than -60 degrees and less than 5 lat
;;  and longitude greater than -180 degrees longitude and          
;;  less than -10 degrees longitude.
;;Examples: (samerica? (make-gps-point -40 -28 1000))=>true   
;;(samerica? (make-gps-point 36 69 -29))=>false
(define (samerica? position)
  (cond [(and (< (gps-point-lat position) 5)
              (> (gps-point-lat position) -60)
              (< (gps-point-long position) -10)
              (> (gps-point-long position) -180)) true]
        [else false]))
;;Tests
;;Within South American territory
(check-expect (samerica? (make-gps-point -40 -28 1000)) true)
;;Outside South American borders
(check-expect (samerica? (make-gps-point 36 69 -29)) false)
(check-expect (samerica? (make-gps-point 36 -29 29)) false)
(check-expect (samerica? (make-gps-point 40 69 -20)) false)
(check-expect (samerica? (make-gps-point 40 -29 -20)) false)
;;Borders of South America
(check-expect (samerica? (make-gps-point 4 -11 674)) true)
(check-expect (samerica? (make-gps-point -59 -179 804)) true)


(define (where-in-the-world position)
  (cond [(ocean? position) 'Ocean]
        [(antarctica? position) 'Antarctica]
        [(australia? position) 'Australia]
        [(africa? position) 'Africa]
        [(europe? position) 'Europe]
        [(namerica? position) 'NorthAmerica]
        [(samerica? position) 'SouthAmerica]
        [else 'Asia]))
;;Tests:
;;Ocean
(check-expect (where-in-the-world (make-gps-point 10 -5 0)) 'Ocean)
;;Antarctica
(check-expect (where-in-the-world (make-gps-point -110 -5 599)) 'Antarctica)
;;Australia
(check-expect (where-in-the-world (make-gps-point -10.5 110.5 123.4)) 'Australia)
;;Europe
(check-expect (where-in-the-world (make-gps-point 44 -27 12)) 'Europe)
;;Africa
(check-expect (where-in-the-world (make-gps-point 32 20 12)) 'Africa)
;;North America
(check-expect (where-in-the-world (make-gps-point 12 -44 12)) 'NorthAmerica)
(check-expect (where-in-the-world waterloo) 'NorthAmerica)
(check-expect (where-in-the-world barbados) 'NorthAmerica)
;;South America
(check-expect (where-in-the-world (make-gps-point -20 -50 12)) 'SouthAmerica)
;; Asia
(check-expect (where-in-the-world (make-gps-point 10 69 12)) 'Asia)
(check-expect (where-in-the-world (make-gps-point -27 68 12)) 'Asia)
(check-expect (where-in-the-world (make-gps-point 0 100 12)) 'Asia)






