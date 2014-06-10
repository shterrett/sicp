(define (analyze-ramb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
          (fail)
          ((let ((next (random choice)))
             (let ((rest (delq next choices)))
               ((next) env
                       succeed
                       (lambda ()
                         (try-next rest)))))))))
    (try-next cprocs)))

; randomness can help Alyssa avoid the local maxima that come
; with the determinstic evaluation of the sentences
