;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a8q2) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks") (lib "compound.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 8, Question 2                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining if a compound is organic by checking for   ;;
;; its carbon content)                                    ;;
;;                                                        ;;
;;********************************************************;;


;; Question 2


;;elements: (listof part)-> boolean
;;Consumes a list of part, lop and produces true if there is carbon
;; in any of the parts in the list.
;;Examples:
;;(elements (compound-lop calcium-phosphate))=> false
;;(elements (compound-lop glucose)) true
;;(elements empty)=> false
(define (elements lop)
  (cond
    [(empty? lop) false]
    [(any-carbon? (first lop)) true]
    [else (elements (rest lop))]))
;;Tests:
(check-expect (elements empty) false)
(check-expect (elements (compound-lop calcium-phosphate)) false)
(check-expect (elements (compound-lop glucose)) true)
(check-expect (elements (compound-lop iron-sulfate)) false)
(check-expect (elements (compound-lop cinnamaldehyde)) true)


;;any-carbon?: part-> boolean
;;Consumes a part p and produces true if the part is element carbon or
;; if it is a compound with carbon in it.
;;Examples:
;;(any-carbon? (make-part 1 phosphorus))=>false
;;(any-carbon? (make-part 3 so-four)) false
;;(any-carbon? (make-part 6 carbon))=> true
;;(any-carbon? (make-part 1 glucose))=> true
(define (any-carbon? p)
  (cond
    [(element? (part-eoc p)) (carbon? (part-eoc p))]
    [(compound? (part-eoc p)) (is-organic? (part-eoc p))]))
;;Tests:
(check-expect (any-carbon? (make-part 1 phosphorus)) false)
(check-expect (any-carbon? (make-part 6 carbon)) true)
(check-expect (any-carbon? (make-part 3 so-four)) false)
(check-expect (any-carbon? (make-part 1 glucose)) true)

;;carbon?: element-> boolean
;;Consumes an element e and produces true if it is carbon
;;Examples:
;;(carbon? carbon)=> true
;;(carbon? hydrogen)=> false
;;(carbon? oxygen)=> false
(define (carbon? e)
  (equal? 'C (element-name e)))
;;Tests:
(check-expect (carbon? carbon) true)
(check-expect (carbon? hydrogen) false)
(check-expect (carbon? oxygen) false)
(check-expect (carbon? sulfur) false)
(check-expect (carbon? argon) false)

;;is-organic?: compound-> boolean
;;Consumes a compound c and produces true if the compound is organic,
;;that is, if it contains any carbon.
;;Examples:
;;(is-organic? calcium-phosphate)=> false
;;(is-organic? glucose)=> true
;;(is-organic? iron-sulfate)=> false
;;(is-organic? cinnamaldehyde)=> true
(define (is-organic? c) 
  (elements (compound-lop c)))
;;Tests:
(check-expect (is-organic? calcium-phosphate) false)
(check-expect (is-organic? glucose) true)
(check-expect (is-organic? iron-sulfate) false)
(check-expect (is-organic? cinnamaldehyde) true)
