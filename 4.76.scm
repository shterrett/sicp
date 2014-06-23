; text
(define (unify-match p1 p2 frame)
  (cond ((eq? frame 'failed) 'failed)
        ((equal? p1 p2) frame)
        ((var? p1) (extend-if-possible p1 p2 frame))
        ((var? p2) (extend-if-possible p2 p1 frame))
        ((and (pair? p1) (pair? p2))
         (unify-match (cdr p1)
                      (cdr p2)
                      (unify-match (car p1)
                                   (car -2)
                                   frame)))
        (else 'failed)))

(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
    frame-stream
    (conjoin (rest-conjuncts conjuncts)
             (qeval (first-conjunct conjuncts)
                    frame-stream))))

; exercise
(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
    frame-stream
    (let ((result-streams (stream-map (lambda (conjunct)
                                        (qeval conjunct frame-stream))
                                      (conjucnts))))
      (stream-flatmap (lambda (frame)
                        (stream-filter (lambda (frame-result)
                                         (not (there-exists? 'failed frame-result)))
                                       frame))
                      result-streams))))
