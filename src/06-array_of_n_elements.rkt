#lang racket

(define (f n)
  (build-list n identity))


(define n (string->number (read-line (current-input-port) 'any)))
(print (f n))
