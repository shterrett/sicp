((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
        1
        (* k (ft ft (- k 1)))))))
 4)

((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fn k)
      (cond ((= k 1) 1)
            ((= k 2) 1)
            (else (+ (fn fn (- k 1)) (fn fn (- k 2))))))))
 4)

(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) #t
       (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0)
       #f
       (ev? ev? od? (- n 1))))))
