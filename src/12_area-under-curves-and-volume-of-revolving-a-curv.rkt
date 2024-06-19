#lang racket

;; polynomial : Real (Listof Real) (Listof Real) -> Real
(define (polynomial x coefficients powers)
  (for/fold ([acc 0])
            ([coefficient coefficients]
             [power powers])
    (+ acc (* coefficient (expt x power)))))

;; integrate : Real Real Real (Listof Real) (Listof Real) (Real Real -> Real) -> Real
(define (integrate a b delta-x coefficients powers integrand-fn)
  (let integrate-helper ([current-x a]
                         [current-y (polynomial a coefficients powers)]
                         [acc 0])
    (let ([next-x (+ current-x delta-x)])
      (cond
        [(> current-x b) acc]
        [(> next-x b) acc]
        [else
         (let* ([next-y (polynomial next-x coefficients powers)]
                [value (integrand-fn current-y next-y)])
           (integrate-helper next-x next-y (+ acc value)))]))))

;; trapezoidal-area : Real Real Real (Listof Real) (Listof Real) -> Real
(define (trapezoidal-area a b delta-x coefficients powers)
  (integrate a b delta-x coefficients powers
             (lambda (current-y next-y)
               (* delta-x (/ (+ current-y next-y) 2)))))

;; disk-method-volume : Real Real Real (Listof Real) (Listof Real) -> Real
(define (disk-method-volume a b delta-x coefficients powers)
  (integrate a b delta-x coefficients powers
             (lambda (current-y next-y)
               (/ (* delta-x pi (+ (sqr current-y) (sqr next-y))) 2))))


(define (parse-line line)
  (map string->number (string-split line)))

(define (read-input)
  (let ([coefficients (parse-line (read-line))]
        [powers (parse-line (read-line))]
        [range (parse-line (read-line))])
    (values coefficients powers (first range) (second range))))

(define-values (coefficients powers a b) (read-input))
(define delta-x 0.001)

(displayln (trapezoidal-area a b delta-x coefficients powers))
(displayln (disk-method-volume a b delta-x coefficients powers))
