#lang racket

(provide fact fact-tail)

(define (fact-tail n acc)
	(if (= 0 n) acc
		(fact-tail (- n 1) (* n acc)) 	
	)	
)

(define (fact n) 
	(fact-tail n 1)
)
