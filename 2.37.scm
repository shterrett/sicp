(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs)) '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 2 3) (list 4 5 6) (list 6 6 7) (list 7 8 9)))
(define v (list 1 2 3 4))
(define w (list 5 6 7 8))



(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product v w)

(define (matrix*vector m v)
  (define (proc mv)
    (accumulate + 0 (map (lambda (x y) (* y x)) mv v)))
  (map proc m))

(matrix*vector m v)

(define (transpose m)
  (accumulate-n cons '() m))

(transpose m)

(define (matrix*matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (matrix*vector cols row))
           m)))

(define x (list (list 1 2) (list 3 4)))
(define y (list (list 5 6) (list 7 8)))

(matrix*matrix m n)

(matrix*matrix x y)







