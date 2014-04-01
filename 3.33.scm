(define (average a1 a2 avg)
  (let ((b (make-connector))
        (c (make-connector)))
    (adder a1 a2 b)
    (constant 0.5 c)
    (multiplier b c avg))
  'ok)

