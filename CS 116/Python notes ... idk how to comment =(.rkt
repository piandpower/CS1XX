;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Python notes ... idk how to comment =(|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
x=7*100
y="undefined"

user_input=raw_input()

name=raw_input('What is your name?')

note=raw_input(use with parametes cuz Lori says so !!)
               ; write down meanings of errors cuz the are diff & vague : /
 ;; number * string / string * number = number # of strings.
;; print: displays variable values-- doesnt produces anything- just display
 
raw-input always produces a string -- even if a string OF a number

 ;; print string-> print w.o quotation.
 
 ;; diff- deals with whats happening now- then later as opposed to how
 ;; evaluated to get to a result.
 ;; empty string is string w/ no characters
 
 
 ;; case sensitive.
 ;c='goat'
 
 ;; use print statements at diff points in the program to help you figure out whats going on.
 ;; in troubleshooting.. dont display extra info... only us prnit statements when debugging and take out afta !!

;; careful w. exact storage of some num 

;;floating-point numbers 

;; int type float type 

;; both => (union int float)

;;name=raw_input('What is your name?')

;;note=raw_input(use w/ parametes cuz Lori says so !!)

;type(  )

;;double equal compares for equal .. not only numbers-- at least strings too !

;; remainder : % <-- put b/w e.g 4 % 3-> 1 (remainder)

;; abs(5%3.2-1.8)< 0.0001  , abs val of a floating pt compare to a really small number.

;; have to import math functions like teachpacks only you have to say import math. 

;; they will say what you can/ cannot use.

;; WE creating creating creating AWOH.. with a colon after

;; def fname (arguments):
;; statements