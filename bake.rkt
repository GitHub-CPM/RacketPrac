#lang racket

(provide bake)

(define (bake flavor)
  (printf "pre-heating oven...\n")
  (string-append flavor " pie"))

(bake "apple")
