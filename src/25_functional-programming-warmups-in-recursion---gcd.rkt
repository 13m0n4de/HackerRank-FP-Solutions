#lang racket

;; gcd : Integer Integer -> Integer
(define (gcd x y)
  (let [(r (remainder x y))]
    (if (= r 0)
        y
        (gcd y r))))

(displayln (gcd (read) (read)))
