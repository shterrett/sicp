(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (add x)
      (let ((new-pair (cons x '())))
        (cond ((eq? front-ptr '())
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else
                (set-cdr! rear-ptr new-pair)
                (set! rear-ptr new-pair)))))
    (define delete!
      (cond ((eq? front-ptr '())
             (error "DELETE! called with an empty queue"))
            (else
              (set! front-ptr (cdr front-ptr)))))
    (define next
      (car front-ptr))
    (define (dispatch m)
      (cond ((eq? m 'add)
             add)
            ((eq? m 'delete!)
             (delete!))
            ((eq? m 'next
                  (next)))
            (else (error "NO METHOD" m)))))
    dispatch))
