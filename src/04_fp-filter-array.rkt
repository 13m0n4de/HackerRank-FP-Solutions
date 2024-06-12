#lang racket

;; filter-less-than : Integer (Listof Integer) -> (Listof Integer)
(define (filter-less-than delim lst)
  (filter (lambda (num) (< num delim)) lst))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(let* ([input (read-list)]
       [n (car input)]
       [lst (cdr input)])
  (for-each displayln (filter-less-than n lst)))
