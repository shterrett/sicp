(define (stream-section n stream)
  (cond ((= n 0) '())
        (else
          (cons
            (head stream)
            (stream-section
              (- n 1)
              (tail stream))))))

(define (merge-stream-pairs s1 s2 weighting)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((s1car (stream-car s1))
                (s2car (stream-car s2)))
            (let ((weight1 (weighting s1car))
                  (weight2 (weighting s2car)))
            (cond ((<= weight1 weight2)
                   (cons-stream s1car (merge-stream-pairs (stream-cdr s1) s2 weighting)))
                  ((> weight1 weight2)
                   (cons-stream s2car (merge-stream-pairs s1 (stream-cdr s2) weighting)))))))))

(define (integers-from n)
  (cons-stream n (integers-from (+ n 1))))
(define integers (integers-from 1))

(define (ordered-pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-stream-pairs
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (ordered-pairs (stream-cdr s) (stream-cdr t))
      (lambda (pair)
        (+ (expt (car pair) 2) (expt (cadr pair) 2))))))

(define ordered-pairs-integers
  (ordered-pairs integers integers))

(define (three-sum-squares)
  (define (find-three-sums stream result)
    (cond ((eq? (stream-car stream) (car (stream-cdr stream)) (car (stream-cdr (stream-cdr stream))))
           (find-three-sums (stream-cdr stream) (cons-stream result (stream-car stream))))
           (else (find-three-sums (stream-cdr stream) result))))
  (find-three-sums ordered-pairs-integers '())
