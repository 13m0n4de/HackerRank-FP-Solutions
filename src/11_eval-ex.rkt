#lang racket

;; factorial : Integer -> Integer
(define (factorial n)
  (let factorial-helper ([acc 1] [n n])
    (if (= n 0)
        acc
        (factorial-helper (* acc n) (- n 1)))))

;; eval-ex : Real -> Real
(define (eval-ex x)
  (-> real? real?)
  (let eval-ex-helper ([acc 0] [y 0])
    (if (= y 10)
        acc
        (eval-ex-helper
         (+ acc (/ (expt x y) (factorial y)))
         (+ y 1)))))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(let* ([input (read-list)]
       [lst (cdr input)])
  (for-each (lambda (x)
              (displayln (eval-ex x)))
            lst))
