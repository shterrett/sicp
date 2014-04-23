(define (stream-section n stream)
  (cond ((= n 0) '())
        (else
          (cons
            (head stream)
            (stream-section
              (- n 1)
              (tail stream))))))

(define (smooth s)
  (define (average x y)
    (/ (+ x y) 2))
  (let ((first (stream-car s))
        (rest (stream-cdr s)))
  (cons-stream (average first  (stream-car rest)) (smooth rest)))))))


(define (alternating)
  (define (build-alt-stream value)
    (if (= 1 value) (cons-stream 1 (build-alt-stream 0))
                    (cons-stream 0 (build-alt-stream 1))))
  (build-alt-stream 1))

(display (stream-section 10 (alternating)))
(display (stream-section 10 (smooth (alternating))))
