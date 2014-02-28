(define (type-tag n)
  (cond ((pair? n) (car n))
        ((number? n) 'scheme-num)
        (else (error "Bad tagged datum -- TYPE-TAG" n))))

(define (contents n)
  (cond ((pair? n) (cdr n))
        ((number? n) n)
        (else (error "Bad tagged datum -- CONTENTS" n))))

(define (attach-tag type-tag n)
  (if (eq? type-tag 'scheme-number)
    n
    (cons type-tag n)))
