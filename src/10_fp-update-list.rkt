#lang racket

;; update-list : (Listof Integer) -> (Listof Integer)
(define (update-list lst)
  (map abs lst))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(for-each displayln (update-list (read-list)))
