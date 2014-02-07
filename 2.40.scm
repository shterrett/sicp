(define (enumerate-interval n)
  (cond ((= n 0) '())
        ((= n 1) (list 1))
        (else (append (enumerate-interval (- n 1)) (list n)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval (- i 1))))
           (enumerate-interval n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; prime? define earlier in text
(define (prime? x) #t) ; as stub returns all pairs + sum

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(enumerate-interval 4)
(unique-pairs 4)
(prime-sum-pairs 4)
