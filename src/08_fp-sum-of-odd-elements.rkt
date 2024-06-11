#lang racket

#| (define (sum-odd lst) |#
#|   (let sum-odd-helper ([lst lst] [acc 0]) |#
#|     (cond |#
#|       [(empty? lst) acc] |#
#|       [else |#
#|        (define x (car lst)) |#
#|        (if (odd? x) |#
#|            (sum-odd-helper (cdr lst) (+ acc x)) |#
#|            (sum-odd-helper (cdr lst) acc))]))) |#

;; (: sum-odd (-> (Listof Integer) Integer))
(define (sum-odd lst)
  (apply + (filter odd? lst)))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(displayln (sum-odd (read-list)))
