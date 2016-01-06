#lang racket
(require (lib "world.ss" "htdp") (lib "list.ss") (lib "etc.ss") (lib "posn.ss" "lang"))
(require lang/prim)
(provide ph=? create-ph draw-ph what-head-colour what-head-size 
         what-l-eye-type what-l-eye-colour what-r-eye-type what-r-eye-colour 
         what-mouth-type what-mouth-colour 
         new-head-colour new-head-size new-left-eye new-l-eye-type new-l-eye-colour
         new-right-eye new-r-eye-type new-r-eye-colour new-mouth new-mouth-type
         new-mouth-colour what-x what-y new-xy move-left move-right move-up move-down
         onepotato monoone leftwinkone rightwinkone sleepone
         twopotato monotwo leftwinktwo rightwinktwo sleeptwo
         threepotato monothree leftwinkthree rightwinkthree sleepthree
         )

;;-------------------------------------------------------------------------------------
;; Structure, data, and constant definitions
;;-------------------------------------------------------------------------------------

;; Mr. Potatohead teachpack: allows selection of colour and size of head, colour and 
;; style of left eye, right eye, and mouth.  The x and y coordinates are preset for
;; images, and later manipulated for animations in the advanced teachpack. The advanced
;; teachpack exposes the structures and supports animations.

;; A ph is a structure (make-ph c s l r m p), where c is the symbol for a 
;; colour recognized  by world.ss, s is an integer size, l and r are eye structures, 
;; m is a mouth structure, and p is a posn structure.

;; An eye is a structure (make-eye t c), where t is a symbol in the set 'circle,
;; 'x, 'star, 'lashes, and 'line, and c is a symbol for a colour recognized by world.ss.

;; A mouth is a structure (make-mouth t c), where t is a symbol in the set 'oh, 
;; 'happy, 'tooth, and 'line, and c is a symbol for a colour recognized by world.ss.

(define-struct ph (col size leye reye mth pos))
(define-struct eye (type col))
(define-struct mouth (type col))

;; Allowed types for eyes and mouths
(define eye-type-list (list 'circle 'x 'star 'lashes 'line))
(define mouth-type-list (list 'oh 'happy 'tooth 'line))

;; Default position
(define default-posn (make-posn 50 50))

;; Sample data
(define circle-red-eye (make-eye 'circle 'red))
(define star-blue-eye (make-eye 'star 'blue))
(define oh-green-mouth (make-mouth 'oh 'green))
(define myph (make-ph 'black 80 circle-red-eye star-blue-eye oh-green-mouth default-posn))           

;; Error messages
(define valid-error "All attributes of the ph must be of the right types.")
(define ph-error "Invalid input: not a ph structure.")
(define eye-error "Invalid input: an eye must be an eye structure.")
(define mouth-error "Invalid input: a mouth must be a mouth structure.")
(define posn-error "Invalid input: position must be a posn structure.")
(define colour-error "Invalid input: head colour must be a symbol.")
(define size-error "Invalid input: head size must be an integer.")
(define eye-type-error "Invalid input: eye type must be 'circle, 'x, 'star, 'lashes, or 'line.")
(define eye-colour-error "Invalid input: eye colour must be a symbol.")
(define l-eye-type-error "Invalid input: left eye type must be 'circle, 'x, 'star, 'lashes, or 'line.")
(define l-colour-error "Invalid input: left eye colour must be a symbol.")
(define r-eye-type-error "Invalid input: right eye type must be 'circle, 'x, 'star, 'lashes, or 'line.")
(define r-colour-error "Invalid input: right eye colour must be a symbol.")
(define mouth-type-error "Invalid input: mouth type must be 'oh, 'happy, 'tooth, or 'line.")
(define mouth-colour-error "Invalid input: mouth colour must be a symbol.")
(define x-error "Invalid input: position x must be an integer.")
(define y-error "Invalid input: position y must be an integer.")
(define step-error "Invalid input: increment must be an integer.")

;;-------------------------------------------------------------------------------------
;; Functions for internal use
;;-------------------------------------------------------------------------------------

;; The function below is used to make eye and mouth sizes proportional to
;; head size.

;; roundup: num num num -> int
;; Produces the a/b fraction of nbr

(define (roundup a b nbr)
  (ceiling (/ (* nbr a) b)))

;; happy-mouth: symbol num -> image
;; Produces image of a happy mouth of given colour for a head of given size
(define (happy-mouth colour size)
  (put-pinhole (overlay/xy 
                (put-pinhole (circle (roundup 2 5 size) 'solid colour) 0 0 ) 
                0 0
                (put-pinhole (rectangle size(roundup 1 4 size) 'solid 'white)
                             0 0)) (roundup 2 5 size) (roundup 1 3 size)))

;; whitetooth: int -> image
;; Produces the image of a tooth for use in tooth-mouth 
(define (whitetooth size)
  (put-pinhole (rectangle size size 'solid 'white) 0 0))

;; tooth-mouth: symbol int -> image
;; Produces the image of a toothy mouth given colour for a head of given size
(define (tooth-mouth colour size)
  (put-pinhole (overlay/xy 
                (overlay/xy 
                 (overlay/xy
                  (put-pinhole (ellipse size (roundup 1 2 size) 'solid 'pink) 0 0 )
                  (roundup 1 4 size) 0 (put-pinhole (whitetooth (roundup 1 6 size)) 0 0 ))
                 (roundup 2 3 size) 0 (put-pinhole (whitetooth (roundup 1 6 size)) 0 0))
                (roundup 1 2 size) (roundup 1 4 size) 
                (ellipse size (roundup 1 2 size) 'outline colour)) (roundup 1 2 size) 0))

;; lashes: symbol int -> image
;; Produces image of an eye with lashes of given colour for a head of given size  
(define (lashes colour size)
  (put-pinhole
   (overlay/xy
    (overlay/xy
     (put-pinhole 
      (star 36 size (roundup 3 2 size) 'solid colour) 0 0) 
     (roundup 3 2 size) (roundup 3 2 size) 
     (circle size 'solid 'white))
    (roundup 3 2 size) (roundup 3 2 size)
    (circle (roundup 1 2 size) 'solid 'black))
   size (roundup 3 2 size)))

;; eye-image: eye int -> image
;; Produces an image of an eye for a head of given size
(define (eye-image aneye size)
  (cond
    [(equal? 'circle (eye-type aneye)) 
     (circle (roundup 1 10 size) 'solid (eye-col aneye))]
    [(equal? 'x (eye-type aneye))
     (put-pinhole (text "x" (roundup 1 5 size) (eye-col aneye)) 0 (roundup 1 5 size))]
    [(equal? 'star (eye-type aneye))
     (star 7 (roundup 1 10 size) (roundup 1 5 size) 'solid (eye-col aneye))]
    [(equal? 'lashes (eye-type aneye)) (lashes (eye-col aneye) (roundup 1 5 size))] 
    [(equal? 'line (eye-type aneye)) (rectangle (roundup 1 5 size) 1 'solid (eye-col aneye))]
    [else (error 'eye-image eye-type-error)]))

;; mouth-image: mouth int -> image
;; Produces an image of a mouth for a head of the given size 
(define (mouth-image amouth size)
  (cond
    [(equal? 'oh (mouth-type amouth) )
     (circle (roundup 2 5 size) 'outline (mouth-col amouth) )]
    [(equal? 'tooth (mouth-type amouth) )
     (tooth-mouth (mouth-col amouth)  size)]
    [(equal? 'happy (mouth-type amouth) )
     (happy-mouth (mouth-col amouth)  size)]
    [(equal? 'line (mouth-type amouth))
     (rectangle (roundup 4 5 size) (roundup 1 10 size)
                'solid (mouth-col amouth) )]
    [else (error 'mouth-image mouth-type-error)]))

;; head-image: symbol int -> image
;; Produces an image of a head outline of the given colour and radius  
(define (head-image colour radius) (put-pinhole (circle radius 'outline colour) 0 0))

;; The validity function is used to generate helpful error messages on invalid input

;; valid-ph?: ph -> boolean
;; Produces true if valid; otherwise returns an error message.
(define (valid-ph? aph)
  (cond
    [(not (ph? aph)) (error 'valid-ph? ph-error)]
    [(not (symbol? (ph-col aph))) (error 'valid-ph? colour-error)]
    [(not (integer? (ph-size aph))) (error 'valid-ph? size-error)]
    [(not (eye? (ph-leye aph))) (error 'valid-ph? eye-error)]
    [(not (member (eye-type (ph-leye aph)) eye-type-list)) (error 'valid-ph? l-eye-type-error)]
    [(not (symbol? (eye-col (ph-leye aph)))) (error 'valid-ph? l-colour-error)]
    [(not (eye? (ph-reye aph))) (error 'valid-ph? eye-error)]
    [(not (member (eye-type (ph-reye aph)) eye-type-list)) (error 'valid-ph? r-eye-type-error)]
    [(not (symbol? (eye-col (ph-reye aph)))) (error 'valid-ph? r-colour-error)]
    [(not (mouth? (ph-mth aph))) (error 'valid-ph? mouth-error)]
    [(not (member (mouth-type (ph-mth aph)) mouth-type-list)) (error 'valid-ph? mouth-type-error)]
    [(not (symbol? (mouth-col (ph-mth aph)))) (error 'valid-ph? mouth-colour-error)]
    [(not (posn? (ph-pos aph))) (error 'valid-ph? posn-error)]
    [(not (integer? (posn-x (ph-pos aph)))) (error 'valid-ph? x-error)]
    [(not (integer? (posn-y (ph-pos aph)))) (error 'valid-ph? y-error)]
    [else true]))

;;-------------------------------------------------------------------------------------
;; Externally visible functions
;;-------------------------------------------------------------------------------------

;; ph=?: ph ph -> boolean
;; Produces true if ph1 and ph2 are equal
(define (ph=? ph1 ph2)
  (cond
    [(not (ph? ph1)) (error 'ph=? "The first parameter should be a ph.")]
    [(not (ph? ph2)) (error 'ph=? "The second parameter should be a ph.")]
    [else (and
           (equal? (ph-col ph1) (ph-col ph2))
           (equal? (ph-size ph1) (ph-size ph2))
           (equal? (eye-type (ph-leye ph1)) (eye-type (ph-leye ph2)))
           (equal? (eye-col (ph-leye ph1)) (eye-col (ph-leye ph2)))
           (equal? (eye-type (ph-reye ph1)) (eye-type (ph-reye ph2)))
           (equal? (eye-col (ph-reye ph1)) (eye-col (ph-reye ph2)))
           (equal? (mouth-type (ph-mth ph1)) (mouth-type (ph-mth ph2)))
           (equal? (mouth-col (ph-mth ph1)) (mouth-col (ph-mth ph2)))
           (equal? (posn-x (ph-pos ph1))(posn-x (ph-pos ph2)))
           (equal? (posn-y (ph-pos ph1))(posn-y (ph-pos ph2))))]))

;; draw-ph : ph -> image
;; Produces an image of the potatohead aph  
(define (draw-ph aph)
  (and (valid-ph? aph)
       (put-pinhole
        (overlay/xy
         (overlay/xy
          (overlay/xy (head-image (ph-col aph) (ph-size aph)) 
                      (roundup 2 3 (ph-size aph)) (roundup 2 3 (ph-size aph))
                      (eye-image (ph-leye aph) (ph-size aph)))
          (roundup 4 3 (ph-size aph)) (roundup 2 3 (ph-size aph)) 
          (eye-image (ph-reye aph) (ph-size aph)))
         (ph-size aph) (roundup 4 3 (ph-size aph))
         (mouth-image (ph-mth aph) (ph-size aph)))
        (ph-size aph) (ph-size aph))))

;; create-ph: symbol int[>0] symbol symbol symbol symbol symbol symbol -> ph
;; Produces a ph with the specified colour, size, left eye type, left eye colour, 
;; right eye type, right eye colour, mouth type, and mouth colour; the position
;; is automatically set to 50 50

(define 
  (create-ph colour radius l-eye-type l-eye-colour r-eye-type r-eye-colour mouth-type mouth-colour) 
  (cond
    [(not (symbol? colour)) (error 'create-ph colour-error)]
    [(not (integer? radius)) (error 'create-ph size-error)]
    [(not (member l-eye-type eye-type-list)) 
     (error 'create-ph l-eye-type-error)]
    [(not (symbol? l-eye-colour)) (error 'create-ph l-colour-error)]
    [(not (member r-eye-type eye-type-list))
     (error 'create-ph r-eye-type-error)]
    [(not (symbol? r-eye-colour)) (error 'create-ph r-colour-error)]
    [(not (member mouth-type mouth-type-list))
     (error 'create-ph mouth-type-error)]
    [(not (symbol? mouth-colour)) (error 'create-ph mouth-colour-error)]
    [else (make-ph 
           colour radius (make-eye l-eye-type l-eye-colour) 
           (make-eye r-eye-type r-eye-colour)
           (make-mouth mouth-type mouth-colour) default-posn)]))

;; Each of these functions takes a ph and returns the value of the specified
;; attribute.

(define (what-head-colour aph)
  (cond
    [(valid-ph? aph) (ph-col aph)]
    [else (error 'what-head-colour ph-error)]))

(define (what-head-size aph)
  (cond
    [(valid-ph? aph) (ph-size aph)]
    [else (error 'what-head-size ph-error)]))

(define (what-l-eye-type aph)
  (cond
    [(valid-ph? aph) (eye-type (ph-leye aph))]
    [else (error 'what-l-eye-type ph-error)]))

(define (what-l-eye-colour aph)
  (cond
    [(valid-ph? aph) (eye-col (ph-leye aph))]
    [else (error 'what-l-eye-colour ph-error)]))

(define (what-r-eye-type aph)
  (cond
    [(valid-ph? aph) (eye-type (ph-reye aph))]
    [else (error 'what-r-eye-type ph-error)]))

(define (what-r-eye-colour aph)
  (cond
    [(valid-ph? aph) (eye-col (ph-reye aph))]
    [else (error 'what-r-eye-colour ph-error)]))

(define (what-mouth-type aph)
  (cond
    [(valid-ph? aph) (mouth-type (ph-mth aph))]
    [else (error 'what-mouth-type ph-error)]))

(define (what-mouth-colour aph)
  (cond
    [(valid-ph? aph) (mouth-col (ph-mth aph))]
    [else (error 'what-mouth-colour ph-error)]))

(define (what-x aph)
  (cond
    [(valid-ph? aph) (posn-x (ph-pos aph))]
    [else (error 'what-x ph-error)]))    

(define (what-y aph)
  (cond
    [(valid-ph? aph) (posn-y (ph-pos aph))]
    [else (error 'what-x ph-error)]))

;; Each of these functions takes a ph and an attribute to change
;; and returns a modified ph.

(define (new-head-colour aph colour)
  (cond 
    [(not (symbol? colour)) (error 'new-head-colour colour-error)]
    [(not (valid-ph? aph)) (error 'new-head-colour ph-error)]  
    [else
     (make-ph colour (ph-size aph) (ph-leye aph)
              (ph-reye aph) (ph-mth aph) (ph-pos aph))]))

(define (new-head-size aph size)
  (cond
    [(not (integer? size)) (error 'new-head-size size-error)]
    [(not (valid-ph? aph)) (error 'new-head-size ph-error)] 
    [else
     (make-ph (ph-col aph) size (ph-leye aph)
              (ph-reye aph) (ph-mth aph) (ph-pos aph))]))

(define (new-left-eye aph new-type new-col)
  (cond
    [(not (member new-type eye-type-list)) (error 'new-left-eye eye-type-error)]
    [(not (symbol? new-col)) (error 'new-left-eye eye-colour-error)]
    [(not (valid-ph? aph)) (error 'new-left-eye ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (make-eye new-type new-col)
              (ph-reye aph) (ph-mth aph) (ph-pos aph))]))


(define (new-l-eye-type aph new-type)
  (cond 
    [(not (member new-type eye-type-list)) (error 'new-l-eye-type eye-type-error)]
    [(not (valid-ph? aph)) (error 'new-l-eye-type ph-error)]
    [else
     (make-ph (ph-col aph)(ph-size aph) (make-eye new-type (eye-col (ph-leye aph)))
              (ph-reye aph)(ph-mth aph)(ph-pos aph))]))

(define (new-l-eye-colour aph new-col)
  (cond
    [(not (symbol? new-col)) (error 'new-l-eye-colour eye-colour-error)]
    [(not (valid-ph? aph)) (error 'new-l-eye-colour ph-error)]
    [else 
     (make-ph (ph-col aph) (ph-size aph) (make-eye (eye-type (ph-leye aph)) new-col)
              (ph-reye aph) (ph-mth aph) (ph-pos aph))]))

(define (new-right-eye aph new-type new-col)
  (cond
    [(not (member new-type eye-type-list)) (error 'new-right-eye eye-type-error)]
    [(not (symbol? new-col)) (error 'new-right-eye eye-colour-error)]
    [(not (valid-ph? aph)) (error 'new-right-eye ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (make-eye new-type new-col) (ph-mth aph)(ph-pos aph))]))

(define (new-r-eye-type aph new-type)
  (cond
    [(not (member new-type eye-type-list)) (error 'new-r-eye-type eye-type-error)]
    [(not (valid-ph? aph)) (error 'new-r-eye-type ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (make-eye new-type (eye-col (ph-reye aph))) (ph-mth aph) (ph-pos aph))]))

(define (new-r-eye-colour aph new-col)
  (cond
    [(not (symbol? new-col)) (error 'new-r-eye-colour eye-colour-error)]
    [(not (valid-ph? aph)) (error 'new-r-eye-colour ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph)(ph-leye aph)
              (make-eye (eye-type (ph-reye aph)) new-col)(ph-mth aph)(ph-pos aph))]))

(define (new-mouth aph new-type new-col)
  (cond
    [(not (member new-type mouth-type-list)) (error 'new-mouth mouth-type-error)]
    [(not (symbol? new-col)) (error 'new-mouth mouth-colour-error)]
    [(not (valid-ph? aph)) (error 'new-mouth ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (ph-reye aph) (make-mouth new-type new-col) (ph-pos aph))]))

(define (new-mouth-type aph new-type)
  (cond
    [(not (member new-type mouth-type-list)) (error 'new-mouth-type mouth-type-error)]
    [(not (valid-ph? aph)) (error 'new-mouth-type ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (ph-reye aph) (make-mouth new-type (mouth-col (ph-mth aph))) (ph-pos aph))]))


(define (new-mouth-colour aph new-col)
  (cond
    [(not (symbol? new-col)) (error 'new-mouth-colour mouth-colour-error)]
    [(not (valid-ph? aph)) (error 'new-mouth-colour ph-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (ph-reye aph)(make-mouth (mouth-type (ph-mth aph)) new-col) (ph-pos aph))]))

;; Each of these functions updates the x and y values by step units
;; in the appropriate direction.

(define (move-left aph step)
  (cond
    [(not (integer? step)) (error 'move-left step-error)]
    [(not (valid-ph? aph)) (error 'move-left ph-error)]
    [else 
     (make-ph  (ph-col aph)(ph-size aph) (ph-leye aph)
               (ph-reye aph) (ph-mth aph)
               (make-posn  (- (posn-x (ph-pos aph)) step) (posn-y (ph-pos aph))))]))

(define (move-right aph step)
  (cond
    [(not (integer? step)) (error 'move-right step-error)]
    [(not (valid-ph? aph)) (error 'move-right ph-error)]
    [else 
     (make-ph  (ph-col aph) (ph-size aph)(ph-leye aph)
               (ph-reye aph)(ph-mth aph)
               (make-posn(+ (posn-x (ph-pos aph)) step)(posn-y (ph-pos aph))))]))

(define (move-up aph step)
  (cond
    [(not (integer? step)) (error 'move-up step-error)]
    [(not (valid-ph? aph)) (error 'move-up ph-error)]
    [else 
     (make-ph  (ph-col aph) (ph-size aph) (ph-leye aph)
               (ph-reye aph) (ph-mth aph)
               (make-posn (posn-x (ph-pos aph))(- (posn-y (ph-pos aph)) step)))]))

(define (move-down aph step)
  (cond
    [(not (integer? step)) (error 'move-down step-error)]
    [(not (valid-ph? aph)) (error 'move-down ph-error)]
    [else 
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (ph-reye aph) (ph-mth aph)
              (make-posn (posn-x (ph-pos aph)) (+ (posn-y (ph-pos aph)) step)))]))

;; new-xy: ph int int -> ph
;; Produces a potatohead with updated x and y values.
(define (new-xy aph x-coord y-coord)
  (cond
    [(not (integer? x-coord)) (error 'new-xy x-error)]
    [(not (integer? y-coord)) (error 'new-xy y-error)]
    [else
     (make-ph (ph-col aph) (ph-size aph) (ph-leye aph)
              (ph-reye aph) (ph-mth aph) (make-posn x-coord y-coord))]))

;;-------------------------------------------------------------------------------------
;; Externally visible constants for examples and tests
;;-------------------------------------------------------------------------------------

;; Components (not externally visible)
(define circle-purple-eye (make-eye 'circle 'purple))
(define circle-green-eye (make-eye 'circle 'green))
(define x-brown-eye (make-eye 'x 'brown))
(define x-green-eye (make-eye 'x 'green))
(define star-green-eye (make-eye 'star 'green))
(define star-orange-eye (make-eye 'star 'orange))
(define lashes-blue-eye (make-eye 'lashes 'blue))
(define lashes-orange-eye (make-eye 'lashes 'orange))
(define lashes-pink-eye (make-eye 'lashes 'pink))
(define lashes-gray-eye (make-eye 'lashes 'gray))
(define line-blue-eye (make-eye 'line 'blue))
(define line-pink-eye (make-eye 'line 'pink))
(define line-green-eye (make-eye 'line 'green))
(define line-purple-eye (make-eye 'line 'purple))
(define line-brown-eye (make-eye 'line 'brown))

(define oh-red-mouth (make-mouth 'oh 'red))
(define oh-orange-mouth (make-mouth 'oh 'orange))
(define happy-pink-mouth (make-mouth 'happy 'pink))
(define happy-green-mouth (make-mouth 'happy 'green))
(define tooth-gray-mouth (make-mouth 'tooth 'gray))
(define tooth-red-mouth (make-mouth 'tooth 'red))
(define line-red-mouth (make-mouth 'line 'red))
(define line-orange-mouth (make-mouth 'line 'orange))
(define line-pink-mouth (make-mouth 'line 'pink))



;; Potatoheads (externally visible)
(define onepotato (make-ph 'orange 80 lashes-blue-eye star-green-eye oh-red-mouth default-posn))
(define monoone (make-ph 'orange 80 lashes-orange-eye star-orange-eye oh-orange-mouth default-posn))
(define leftwinkone (make-ph 'orange 80 line-blue-eye star-green-eye oh-red-mouth default-posn))
(define rightwinkone (make-ph 'orange 80 lashes-blue-eye line-green-eye oh-red-mouth default-posn))
(define sleepone (make-ph 'orange 80 line-blue-eye line-green-eye line-red-mouth default-posn))

(define twopotato (make-ph 'green 60 circle-purple-eye x-brown-eye happy-pink-mouth default-posn))
(define monotwo (make-ph 'green 60 circle-green-eye x-green-eye happy-green-mouth default-posn))
(define leftwinktwo (make-ph 'green 60 line-purple-eye x-brown-eye happy-pink-mouth default-posn))
(define rightwinktwo (make-ph 'green 60 circle-purple-eye line-brown-eye happy-pink-mouth default-posn))
(define sleeptwo (make-ph 'green 60 line-purple-eye line-brown-eye line-pink-mouth default-posn))

(define threepotato (make-ph 'gray 100 lashes-pink-eye lashes-pink-eye tooth-red-mouth default-posn))
(define monothree (make-ph 'gray 100 lashes-gray-eye lashes-gray-eye tooth-gray-mouth default-posn))
(define leftwinkthree (make-ph 'gray 100 line-pink-eye lashes-pink-eye tooth-red-mouth default-posn))
(define rightwinkthree (make-ph 'gray 100 lashes-pink-eye line-pink-eye tooth-red-mouth default-posn))
(define sleepthree (make-ph 'gray 100 line-pink-eye line-pink-eye line-red-mouth default-posn))
