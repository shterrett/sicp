(define (make-dequeue)
  ('() '()))

(define (front-dequeue dequeue)
    (car dequeue))

(define (rear-dequeue dequeue)
    (cadr dequeue))

(define (empty? dequeue)
  (eq? '() (front-dequeue dequeue)))

(define (set-front-ptr! dequeue element)
  (set-car! dequeue element))

(define (set-rear-ptr! dequeue element)
  (set-cdr! dequeue element))

(define (make-element val)
  (cons val (cons '() '())))

(define (value element)
  (car element))

(define (next-element element)
  (cadr element))

(define (prev-element element)
  (caar element))

(define (set-next! element next)
  (set-cdr! (next-element element) next))

(define (set-prev! element prev)
  (set-car! (prev-element element) prev))

(define (insert-front! dequeue value)
  (let ((new-value (make-element value)))
    (cond ((empty? dequeue) (set-front-ptr! dequeue new-value)
                            (set-rear-ptr! dequeue new-value)
                            dequeue)
          (else (set-next! new-value (front-dequeue dequeue))
                (set-prev! (front-dequeue dequeue) new-value)
                (set-front-ptr! dequeue new-value)
                dequeue))))

(define (insert-rear! dequeue value)
  (let ((new-value (make-element value)))
    (cond ((empty? dequeue) (set-front-ptr! dequeue new-value)
                            (set-rear-ptr! dequeue new-value)
                            dequeue)
          (else (set-next! (rear-dequeue dequeue) new-value)
                (set-prev! new-value (rear-dequeue dequeue))
                (set-rear-ptr! dequeue new-value)
                dequeue))))

(define (delete-front! dequeue)
  (cond ((empty? dequeue) (error "empty dequeue" dequeue))
        (else (set-front-ptr! (next-element (front-dequeue dequeue)))
              (set-prev! (front-dequeue dequeue) '()))))

(define (delete-rear! dequeue)
  (cond ((empty? dequeue) (error "empty dequeue" dequeue))
        (else (set-rear-ptr! (prev-element (rear-dequeue dequeue)))
              (set-next! (rear-dequeue dequeue) '()))))
