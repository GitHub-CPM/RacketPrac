#lang racket

(require plot)
(define n 10)
(define f (λ (t) (vector t 
                         (/ 
                          (sqr (sin (* (/ n 2) t)))
                          (sqr (sin (* 0.5 t)))
                         )
                 )))

(define eps 0.01)
(define tmin (- pi))
(define t1 (- eps))
(define t2 eps)
(define t3 pi)
(define t4 (- (* 2 pi) eps))
(define t5 (+ (* 2 pi) eps))
(define tmax (* 3 pi))

(define global-maximum (f t1))
(define primary-minimum-1 (f (- (/ (* 2 pi) n))))
(define primary-minimum-2 (f (+ (/ (* 2 pi) n))))

(define to-render (list
		   (point-label global-maximum "global maximum"
			#:point-size 5
			#:color (line-color)
			#:point-color (line-color)
			#:anchor 'bottom
			)
		   (point-label primary-minimum-1 "primary minimum pair"
			#:point-size 5
			#:color (line-color)
			#:point-color (line-color)
			#:anchor 'top
			)
		   (point-label primary-minimum-2 ""
			#:point-size 5
			#:color (line-color)
			#:point-color (line-color)
			#:anchor 'top
			)
                   (parametric f tmin t1)
                   (parametric f t2 t3)
                   (parametric f t3 t4)
                   (parametric f t5 tmax)
                   ))

(define wfilepath "./n_emitter_interference_pattern.png")
(plot-file to-render
      wfilepath
      'png
      #:y-min (- 20.0) 
      #:y-max 120.0 
      #:x-label "phi"
      #:y-label "intensity"
      #:title "Interference of N Emitters on Infinitely Distant Wall")
