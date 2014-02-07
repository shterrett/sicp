(define (make-vect x y)
  (cons x y))

(define (xcor-vert vert)
  (car vert))

(define (ycor-vert vert)
  (cdr vert))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (make-vect (* (xcor-vect v))
             (* (ycor-vect v))))
