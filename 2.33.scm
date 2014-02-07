(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (next rest)
                (cons (p next) rest)
                ) '() sequence))

(map (lambda (x) (* 2 x)) (list 1 2 3 4))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3 4) (list 5 6 7 8))

(define (length seq)
  (accumulate (lambda (next accumulator)
                (+ accumulator 1))
              0 seq))

(length (list 1 2 3 4))
