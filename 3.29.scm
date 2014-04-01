(define (or-gate a1 a2 output)
  (let ((b1 (make-wire))
        (b2 (make-wire))
        (c (make-wire)))
    (inverter a1 b1)
    (inverter a2 b2)
    (and-gate b1 b2 c)
    (inverter c output)
    'ok))

; the delay is (2 * inverter-delay) + and-delay
; a1 --> inverter --> b1 \
;                         = > and --> c --> inverter --> output
; a2 --> inverter --> b2 /
;     inverter-delay        and-delay    inverter-delay
