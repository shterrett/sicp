; Exercise
(define (flatten-stream stream)
  (if (stream-null? stream)
    the-empty-stream
    (interleave
      (stream-car stream)
      (flatten-stream (stream-cdr stream)))))

; Text
(define (flatten-stream stream)
  (if (stream-null? stream)
    the-empty-stream
    (interleave-delayed
      (stream-car stream)
      (delay (flatten-stream (stream-cdr stream))))))

; We must delays the evaluation of flatten-stream because
; the stream may be inifinite. If the stream is infinite
; and the recursive call to flatten-stream is not delayed
; then flatten-stream will enter an infinite loop and the
; program will die.
