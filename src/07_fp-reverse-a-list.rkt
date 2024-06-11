#lang racket

#| (define (reverse-list lst) |#
#|   (let reverse-list-helper ([lst lst] [acc '()]) |#
#|     (cond |#
#|       [(empty? lst) acc] |#
#|       [else |#
#|        (reverse-list-helper |#
#|         (cdr lst) |#
#|         (cons (car lst) acc))]))) |#

;; (: reverse-list (-> (Listof Integer) (Listof Integer)))
(define (reverse-list lst)
  (foldl cons '() lst))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(for-each displayln (reverse-list (read-list)))
