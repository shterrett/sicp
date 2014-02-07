(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin1 frame)
  (car frame))

(define (edge1-1 frame)
  (car (cdr frame)))

(define (edge1-2 frame)
  (car (cdr (cdr frame))))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin2 frame)
  (car frame))

(define (edge2-1 frame)
  (car (cdr frame)))

(define (edge2-2 frame)
  (cdr (cdr frame)))
