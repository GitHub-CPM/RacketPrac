#lang racket

; This script is supposed to be run under DrRacket.

(require plot)
(define f (λ (t) (vector t 
                         (/ 
                          (* (sin (* 5 t)) (sin (* 5 t)))
                          (* (sin (* 0.5 t)) (sin (* 0.5 t)))
                         )
                 )))
(define tmin 0.1)
(define tmax (- (* 2 pi) 0.1))
(define to-render (parametric f tmin tmax))
(plot to-render)
