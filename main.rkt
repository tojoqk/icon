#lang racket/base
(require 2htdp/image)

(define size 512)
(define scale 0.35)
(define background (rectangle size size "solid" "black"))
(define velocity 1)

(define (move-circle img i)
  (let ([t (* velocity i)])
    (place-image
     (circle (* (/ size (/ 4 scale)))
             10
             "red")
     (+ (/ size 1.8)
        (* (/ size (/ 1.0 scale))
           (* 0.8 (cos (* 0.02 t)))))
     (+ (quotient size 2)
        (* (/ size (/ 2.0 scale))
           (+ (* 1.2 (sin (* 0.01 t)))
              (* 0.5 (sin (* 0.02 t)))
              (* 0.4 (sin (* -0.03 t)))
              (* -0.4 (sin (* -0.03 t)))
              (* 0.2 (sin (* -0.06 t)))
              (* -0.3 (sin (* 0.1 t))))))
     img)))

(define (create n f)
  (for/fold ([img background])
            ([i n])
    (f img i)))

(define result
  (rotate 270 (create (* 311 4) move-circle)))

(save-image result
            "tojoqk.png")

