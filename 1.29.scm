(define (cube x)
  (* x x x))

(define (h b a n)
  (/ (- b a) n))

(define (c k)
  (+ 2 (* 2 (remainder k 2))))

(define (term a k h)
  (+ a (* k h)))

(define (y f term)
  (f term))

(define (integral f a b n)
  (* (/ (h b a n) 3)
     (+ (f (term a 0 (h b a n)))
        (f (term a n (h b a n)))
        (interval-sum f a b 1 (- n 1)))))

(define (interval-sum f start end step num-steps)
  (if (> step num-steps) 0
    (+ (* (c step) (f (term start step (h end start num-steps))))
       (interval-sum f start end (+ 1 step) num-steps))))

(integral cube 0.0 1.0 100)
(integral cube 0.0 1.0 1000)
(integral cube 0.0 1.0 10000)
