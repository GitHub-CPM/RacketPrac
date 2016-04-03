#lang racket

(provide reply-more)

(define (reply-more s)
	(cond 
		[(equal? "hello" (substring s 0 5)) 
		"hi"]
		[(equal? "goodbye" (substring s 0 7))
		"bye!"]
		[(equal? "?" (substring s (- (string-length s) 1)))
		"I don't know"]
		[else "huh?"]
	)
) 
