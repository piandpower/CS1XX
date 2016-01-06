;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |generative recursion|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt" "installed-teachpacks") (lib "draw.ss" "teachpack" "htdp")))))
(define (generative-recursive-fun problem)
  (cond
    [(trivially-solvable? problem)
     (determine-solution problem)]
    [else
     (combine-solutions
       ... problem ...
       (generative-recursive-fun (generate-problem-1 problem))
       
       (generative-recursive-fun (generate-problem-n problem)))]))
Definition:
Of course, this template is only a suggestive blueprint, not a definitive shape. Each function in the template is to remind us that we need to think about the following four questions:
What is a trivially solvable problem?

What is a corresponding solution?

How do we generate new problems that are more easily solvable than the original problem? Is there one new problem that we generate or are there several?

Is the solution of the given problem the same as the solution of (one of) the new problems? Or, do we need to combine the solutions to create a solution for the original problem? And, if so, do we need anything from the original problem data?

To define the algorithm, we must express the answers to these four questions in terms of our chosen data representation.

Test:
Once we have a complete function, we must also test it. As before, the goal of testing is to discover bugs and to eliminate them. Remember that testing cannot validate that the function works correctly for all possible inputs. Also remember that it is best to formulate tests as boolean-valued expressions that automatically compare the expected value with the computed value (see section 17.8).