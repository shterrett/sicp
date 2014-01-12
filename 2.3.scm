(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-side p1 p2)
  (cons p1 p2))
(define (start side)
  (car side))
(define (end side)
  (cdr side))

(define (distance p1 p2)
  (define (sq-diff a b)
    (expt (- a b) 2))
  (sqrt (+ (sq-diff (x-point p1) (x-point p2))
           (sq-diff (y-point p1) (y-point p2)))))

(define (rectangle-1 p1 p2 p3 p4)
  (cons p1 (cons p2 (cons p3 (cons p4 true)))))

(define (side-length-1 i rectangle)
  (define (nth-point i rectangle)
    (if (= i 1) (car rectangle)
                (nth-point (- i 1) (cdr rectangle))))
  (cond ((and (>= i 1) (<= i 3))
         (distance (nth-point i rectangle)
                   (nth-point (+ i 1) rectangle)))
        ((= i 4)
         (distance (nth-point 4 rectangle)
                   (nth-point 1 rectangle)))))

(define (rectangle-2 p1 p2 p3 p4)
  (define (side start end)
    (cons start end))
  (cons (side p1 p2) (side p2 p3)))

(define (side-length-2 i rectangle)
  (define (long-side rectangle)
    (car rectangle))
  (define (short-side rectangle)
    (cdr rectangle))
  (cond ((or (= i 1) (= i 3))
         (distance (start (long-side rectangle))
                   (end (long-side rectangle))))
        ((or (= i 2) (= i 4))
         (distance (start (short-side rectangle))
                   (end (short-side rectangle))))))

(define (perimeter rect side-length)
  (+ (* 2 (side-length 1 rect))
     (* 2 (side-length 2 rect))))

(define (area rect side-length)
  (* (side-length 1 rect)
     (side-length 2 rect)))

(define rect-1
  (rectangle-1 (make-point 1 1)
               (make-point 1 2)
               (make-point 2 2)
               (make-point 2 1)))

(define rect-2
  (rectangle-2 (make-point 1 1)
               (make-point 1 2)
               (make-point 2 2)
               (make-point 2 1)))

(perimeter rect-1 side-length-1)
(area rect-1 side-length-1)
(perimeter rect-2 side-length-2)
(area rect-2 side-length-2)
