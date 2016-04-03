#lang racket

(require srfi/14)
(require unstable/contract)

(provide tokenizer)

(define (tokenizer s delimiters_to_include delimiters_to_exclude)
	(define padded_s (string-append (string-append " " s) " "))
	(define ret '())
	(define buff "")
	(for ([ch (string->list padded_s)])
		(cond 
			[(char-set-contains? delimiters_to_include ch)
				(cond
					[(non-empty-string? buff) (set! ret (append ret (list buff)))]
				) 	
				(set! ret (append ret (list (~a ch)))) 	
				(set! buff "")	
			]
			[(char-set-contains? delimiters_to_exclude ch)
				(cond
					[(non-empty-string? buff) (set! ret (append ret (list buff)))]
				) 	
				(set! buff "")	
			]
			[else 
				(set! buff (string-append buff (~a ch)))		
			]
		)
	)
	ret
)

(tokenizer "8+7 -    ( 10* 100.891-(u/v	- 12901.1421*999)	 	)" (string->char-set "+-*/()") (string->char-set " \t"))
