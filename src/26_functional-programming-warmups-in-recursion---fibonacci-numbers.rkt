#lang racket

;; fibonacci : Integer -> Integer
(define (fibonacci n)
  (define (fib-helper a b count)
    (if (= count 3)
        (+ a b)
        (fib-helper b (+ a b) (- count 1))))
  (cond
    [(= n 1) 0]
    [(= n 2) 1]
    [else (fib-helper 0 1 n)]))

(displayln (fibonacci (read)))
