;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a7q4) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt" "installed-teachpacks")))))
;;********************************************************;;
;; CS 115 Assignment 7, Question 4                        ;;
;; Christopher Alert                                      ;;
;;                                                        ;;
;;(Determining the parent with the most numerous offspring;;
;; from within the evolutionary tree)                     ;;
;;                                                        ;;
;;********************************************************;;


(define-struct movie-info (name director duration type))
;; A movie-info is a structure (make-movie-info n d du t), where 
;; n is a string (for the name of the movie, d is a string for
;; director of the movie, du is a nat for the length of the 
;; movie (in minutes), and t is a symbol of the type (or 
;; genre) of the movie (e.g. 'drama, 'comedy, etc.)

(define-struct movie-rating-node (rating movies left right))
;; A movie-bst is empty, or 
;; (make-movie-rating-node r m lft rgt), where r is 
;; a number between 0 and 10 (the rating level of a movie), 
;; m is a (listof movie-info) for the list of movies with 
;; rating r, and lft and rgt are of type movie-bst. The 
;; ratings in lft are all less than r, and the ratings in rgt 
;; are all greater than r. 


;; Question 4

;;Defined Constants
(define imdb 
  (make-movie-rating-node 
   8
   (list 
    (make-movie-info "Philadelphia Story" "George Cukor" 112 'comedy) 
    (make-movie-info "Arsenic and Old Lace" "Frank Capra" 118 'comedy))
   (make-movie-rating-node 
    5.9 
    (list 
     (make-movie-info "Strangers with Candy" "Paul Dinello" 97 'comedy))
    empty empty)
   (make-movie-rating-node 
    8.7 
    (list
     (make-movie-info "Star Wars" "George Lucas" 121 'sci-fi)
     (make-movie-info "Casablanca" "Michael Curtiz" 102 'drama))
    empty empty)))

(define (at-standard-at-node movlst)
  (cond 
    [(empty? movlst) empty]
    [else (cons (movie-info-name (first movlst))
                (at-standard-at-node (rest movlst)))]))


;;at-standard=movies movie-bst num-> (listof string)
;;Consumes imdb, a movie bst with movie-info lists at each node
;;corresponding to the different ratings and a target rating
;;and produces a list of the names of the movies with at least
;;the target rating

(define (at-standard-movies imdb target)
  (cond 
    [(empty? imdb) empty]
    [else (cond
            [(empty? imdb) empty]
            [(>= target (movie-rating-node-rating imdb))
             (cons (at-standard-at-node (movie-rating-node-movies imdb))
                   (cond [(>= target (movie-rating-node-rating
                                      (movie-rating-node-left imdb)))
                          (cons (at-standard-at-node (movie-rating-node-movies
                                                      (movie-rating-node-left imdb)))
                                 (at-standard-at-node 
                                  (movie-rating-node-movies
                                   (movie-rating-node-right imdb))))]
[else (at-standard-at-node (movie-rating-node-movies
                            (movie-rating-node-right imdb)))]
))]
[else empty])]))
;;Tests:
(at-standard-movies imdb 8)
(at-standard-movies imdb 7.5)



;;Consumes imdb, a movie bst with movie-info lists at each node
;;corresponding to the different ratings and a target rating
;;and produces a list of the names of the movies with at least
;;the target rating
(define (good-movies imdb target)
  (at-standard-movies imdb target))


(at-standard-movies imdb 8)

;(define (at-standard-at-node imdb target)
;(cond 
; [(empty? imdb) empty]
; [(

;(define (extend-list aname l r)
;(cond 
;[(cons? l) (cons aname l)]
;[(cons? r) (cons aname r)]
;[else ]))





;(define (fun t)
;  (cond
;    [(empty? t) ...]
;    [else ...(node-key t)..
;          ...(node-val t)..
;          ...(fun (node-left t))...
;          ...(fun (node-right t))..]))