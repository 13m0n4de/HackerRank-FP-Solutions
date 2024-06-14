#lang racket

;; valid-function? : Listof(Integer) -> Boolean
(define (valid-function? pairs)
  (define mapping (make-vector 501 -1))
  (for/and ([pair pairs])
    (match-let ([(list x y) pair])
      (let ([mapped-y (vector-ref mapping x)])
        (cond
          [(= mapped-y -1)
           (vector-set! mapping x y)
           #t]
          [(= mapped-y y) #t]
          [else #f])))))

(define (read-test-case)
  (for/list ([_ (in-range (read))])
    (list (read) (read))))

(define (read-test-cases)
  (for/list ([_ (in-range (read))])
    (read-test-case)))

(define test-cases (read-test-cases))
(for ([test-case test-cases])
  (if (valid-function? test-case)
      (displayln "YES")
      (displayln "NO")))
