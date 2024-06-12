#lang racket

;; replicate-elements : Integer (Listof Integer) -> (Listof Integer)
(define (replicate-elements n lst)
  (append-map (lambda (num) (make-list n num)) lst))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(let* ([input (read-list)]
       [n (car input)]
       [lst (cdr input)])
  (for-each displayln (replicate-elements n lst)))
