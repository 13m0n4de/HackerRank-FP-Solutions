#lang racket

;; distance : (Listof Integer) (Listof Integer) -> Number
(define (distance point-a point-b)
  (let ([ax (first point-a)]
        [ay (second point-a)]
        [bx (first point-b)]
        [by (second point-b)])
    (sqrt (+ (expt (- bx ax) 2)
             (expt (- by ay) 2)))))

;; perimeter : (Listof (Listof Integer)) -> Number
(define (perimeter points)
  (define first-point (first points))
  (let perimeter-helper ([acc 0.0]
                         [remaining-points (cdr points)]
                         [prev-point first-point])
    (if (empty? remaining-points)
        (+ acc (distance prev-point first-point))
        (perimeter-helper (+ acc (distance prev-point (first remaining-points)))
                          (cdr remaining-points)
                          (first remaining-points)))))

(define (read-points)
  (for/list ([_ (in-range (read))])
    (list (read) (read))))

(displayln (perimeter (read-points)))
