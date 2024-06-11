#lang racket

;; (: remove-odd (-> (Listof Integer) (Listof Integer)))
(define (remove-odd lst)
  (let remove-odd-helper ([lst lst] [index 0] [acc '()])
    (cond
      [(empty? lst) (reverse acc)]
      [(odd? index) (remove-odd-helper (cdr lst) (+ index 1) acc)]
      [else (remove-odd-helper (cdr lst) (+ index 1) (cons (car lst) acc))])))

(define (read-list)
  (let read-list-helper ([acc '()])
    (let ([x (read)])
      (if (eof-object? x)
          (reverse acc)
          (read-list-helper (cons x acc))))))

(let* ([input (read-list)]
       [lst (cdr input)])
  (for-each displayln (remove-odd lst)))
