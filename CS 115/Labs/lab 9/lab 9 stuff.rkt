;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |lab 9 stuff|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; Lab 9, Question 2

(define (create-events typelist durlist)
  ...)

;; Lab 9, Question 3

(define (extract-bad bad-part whole-string)
  ...)

;; Lab 9, Question 4

(define (subseq-string pattern target)
  ...)

Create a function create-events that consumes two lists of the same length, a list of symbols and a list of positive integers, and produces a list of events.

3. Create a function extract-bad that consumes two strings, bad-part and whole-string, and produces the string formed by removing bad-part from whole-string. The characters in bad- part will appear in whole-string, in order, though not necessarily consecutively. For exam- ple, (extract-bad "aadba" "abracadabra") will produce "brcaar". Here the eliminated characters are shown in upper case: "AbrAcaDaBrA".

4. Create a function subseq-string that consumes two strings of letters in lowercase (a pattern and a target) and produces a string showing how much of the pattern can be found in the target. The string that is produced will have all the same letters as the target, but with some of them changed to uppercase to show where and how much of the pattern can be found. For example, with pattern "hat" and target "chordality", your function will produce "cHordAliTy". For the pattern "hat" and the target "hand", your function will produce "HAnd". The pattern will be found at most once, with each character as far to the left as possible: (subseq-string "hat" "hhat") produces "HhAT" and (subseq-string "hat" "hathat") produces "HAThat". Write a helper function that handles lists of characters.
1

5. Optional open-ended question In Lab 6 you were asked to consider functions on numbers represented in binary as lists of booleans. Now consider functions on pairs of numbers encoded this way. Write functions to add two such numbers, subtract one number from another, comparing two numbers to see which is larger, and so on.