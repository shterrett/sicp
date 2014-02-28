(define f
  (let (( total 0))
    (lambda (x)
      (if (= total 0) (set! total x)
        (set! total (- total x)))
      total)))

(+ (f 1) (f 0))
(+ (f 0) (f 1))
