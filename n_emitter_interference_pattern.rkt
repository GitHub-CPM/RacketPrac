#lang racket

(require plot)
(define f (λ (t) (vector t 
                         (/ 
                          (sqr (sin (* 5 t)))
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

(define to-render (list
                   (parametric f tmin t1)
                   (parametric f t2 t3)
                   (parametric f t3 t4)
                   (parametric f t5 tmax)
                   ))

(define wfilepath "./n_emitter_interference_pattern.png")
(plot-file to-render
      wfilepath
      'png
      #:x-label "phi"
      #:y-label "intensity"
      #:title "Interference of N Emitters on Infinitely Distant Wall")
