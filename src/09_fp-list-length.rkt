#lang racket

;; (: list-length (-> (Listof Integer) Integer))
(define (list-length lst)
  (let list-length-helper ([lst lst] [acc 0])
    (if (empty? lst)
        acc
        (list-length-helper (cdr lst) (+ acc 1)))))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(displayln (list-length (read-list)))
