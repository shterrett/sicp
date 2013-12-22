(define (f-iter a b c count)
  (if (= 3 count) a
      (f-iter (+ a
                 (* 2 b)
                 (* 3 c))
              a
              b
              (- count 1))))

(define (f n)
  (if (< n 3) n
      (f-iter 4 2 1 n)))

(f 5)
