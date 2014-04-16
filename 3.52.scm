(define sum 0)
; sum = 0

(define (accum x)
  (set! sum (+ x sum))
  sum)
; sum = 0

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
; sum = 210
; seq = (1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190 210)

(define y (stream-filter even? seq))
; sum = 210
; y = (6 10 28 36 66 78 120 136 190 210)

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
; z = (10 15 45 55 105 120 190 210)

(stream-ref y 7)
; (6 10 28 36 66 78 120)
(display-stream z)
; (10 15 45 55 105 120 190 210)
