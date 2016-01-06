;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Feb 8- Mutation example-mem model stuff scheme end!|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))

;; Feb 8th 

(define-struct triangle (vertex1 vertex2 vertex3))
;; a triangle is a structure (make-triangle v1 v2 v3))
;; where v1,v2,v3 are all posn (for the three vertices of the triangle).

(define tri-1 (make-triangle (make-posn 0 0)
                             (make-posn 1 1)
                             (make-posn -1 1)))
(define tri-2 tri-1)
tri-1
tri-2

(set-triangle-vertex3! tri-1 (make-posn 15 20))
tri-1

(set-triangle-vertex1! tri-1 (triangle-vertex2 tri-2))
tri-1

(set-posn-y! (triangle-vertex3 tri-1) -17.5)
tri-1

;; write a function update coordinate ( triangle 123 ? x or y?


;; mUTATION EXAMPLE
;; Maintain a system to keep track of an online-order namely shoping cart itema and a running total for the cost of items in the shopping cart. Note that taces arent calculated till you check out.

;;Defeine structure 

(define-struct item (price amt))
;;An item is a structute (amke-item p a),where,
;;p is a non-neg number (cost of an item)
;; a is a natural num (how many to buy)

;define tax constants
(define gst 0.05)
(define pst 0.08)

;;Define state-variables-variables that can be accessed in the etire program, and whose values 
;; reflect the state of the program.

;; total= pre-tax total of items in shopping cart (num>= 0)
(define total 0)
;;list of items that someone wants to but-with the most
;; recent item added to the list stored at the front
(define cart empty)

;; *******Add to cart*******
;; write a fn add-to-cart that consumes a item .. 
;; and price and number and creates an item structure
;; for those values and adds it to the front of the cart,
;; updating the total cost
;; the function produces (void)


;; add-to-cart: (num >= -] nat-> (void)
;; purpose: produces void
;; effects: adds (make-item p qty) to the front of the shoping cart list
;; examle:
; suppose cart contains (list (make-item 5.99 10))
;; and total is 59.90, then add-to-cart 10.00 1), after-wards
;; cart is (list (make-item 10.00 1) (make-item 5.99 10))
;; and total is 69.90.
(define (add-to-cart p qty)
 (begin
   (set! total (+ total (* p qty)))
   (set! cart (cons (make-item p qty) cart))))
   
   
;;Tests for add-to-cart
(check-expect
 (begin
   ;; set initial values for test: total to 0 and empty cart
   (set! total 0)
   (set! cart empty)
   ;;buy 5 of a 2.00 item
   (add-to-cart 2.00 5)
   ;; check the values of both variables
   (and (= total 10.0)
        (equal? cart (list (make-item 2.00 5)))))
 true)

(check-expect 
 (begin
   ;;set initial values for test: total to 0 and empty cart
   (set! total 0)
   (set! cart empty)
   ;;buy 5 of a 2.00 item
   ;; and 10 of a 0.50 item
   (add-to-cart 2.00 5)
   (add-to-cart 0.50 10)
   ;; check-the baues of both variables
   (and (= total 15.0)
        (equal? cart (list (make-item 0.5 10) (make-item 2.00 5)))))
 true)

(define (clear-cart)
  (begin
    (set! total 0)
    (set! cart empty)))
(check-expect
 (begin
   (add-to-cart 2.00 5)
   (clear-cart)
   (equal? cart empty))
 true)

;; ***** Customer structure

(define-struct customer (name credit-card orders total max-order))
;; A customer is a (ame credit-card orders total max-order))
;; A customer is a structure (make-customer n c o t m)), where
; n is a string
; c is a string
; o is anat num (num of orders made online)
;; t is a non neg num - total amt of money spent on a single order

;;Create cust
;; consumes two strings (cust name ) and (cust credit) and produces a cust 
;; structure for that person with no orders completed for $0 total spent
;;

;;;
;;;;
;;;
;;
;;
;;
;;;;;;;
;;
;;
;;

;
;;;Checkout

;; update the gn check-out to consume one parameter, a 
;;cust object and associate the current shopping cart wih 
;; that customer, updating all apppropriate fields for the customer.
;; Produces total value of the purchase, and clears the shopping cart.

;; check-out: customer -> num[>= 0]
(define (check-out client)
  (local
    [(define cart-total
       (+ total (* (+ gst pst) total)))]
  (begin
    (set-customer-orders! client (add1 (customer-orders client)))
    (set-customer-total! client (+ cart-total
                                   (customer-total client)))
    (set-customer-max-order! client
                             (max cart-total (customer-max-order client)))
    (set! total 0)
    (set! cart empty)
    cart-total)))
;; Testing:
(define a-buyer (make-customer "Lori" "abc" 0 0 0))
(define amt 0)

(check-expect
 (begin
   (set! total 10.0)
   (set! cart (list (make-item 2.00 5)))
   (set! a-buyer (make-customer "Lori" "123" 0 0 0))
   (set! amt (check-out a-buyer))
   (and (= total 0)
        (empty? cart)
        (= amt 11.30)
        (equal? a-buyer (make-customer "Lori" "123" 1 11.30 11.30))))
 true)
;; to test: - set inital values for cart, total, and a customer
;; call check-out (remember value produced

;; to pass test we need correct customer info
;; -cart must be right (empty)
;; total 
;;- produced value
;; put all in a begina nd the last expression be the produced value
;; equals... combine tests with an and
;; value should be true.