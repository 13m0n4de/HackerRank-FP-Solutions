#lang racket

;; cross-product : (Listof Integer) (Listof Integer) -> Number
(define (cross-product point-a point-b)
  (let ([ax (first point-a)]
        [ay (second point-a)]
        [bx (first point-b)]
        [by (second point-b)])
    (- (* ax by) (* bx ay))))

;; area : (Listof (Listof Integer)) -> Number
(define (area points)
  (define first-point (first points))
  (let shoelace ([acc 0.0]
                 [remaining-points (cdr points)]
                 [prev-point first-point])
    (if (empty? remaining-points)
        (/ (abs (+ acc (cross-product prev-point first-point))) 2)
        (shoelace (+ acc (cross-product prev-point (first remaining-points)))
                  (cdr remaining-points)
                  (first remaining-points)))))

(define (read-points)
  (for/list ([_ (in-range (read))])
    (list (read) (read))))

(displayln (area (read-points)))
