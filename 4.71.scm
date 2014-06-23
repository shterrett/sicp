; Louis Reasoner
(define (simple-query query-pattern frame-stream)
  (stream-flatmap
    (lambda (frame)
      (stream-append (find-assertions query-pattern frame)
                     (apply-rules query-pattern frame)))
    frame-stream))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
    the-empty-stream
    (interleave
      (qeval (first-disjunct disjuncts) frame-stream)
      (disjoin (rest-disjuncts disjuncts) frame-stream))))

; Text
(define (simple-query query-pattern frame-stream)
  (stream-flatmap
    (lambda (frame)
      (stream-append-delayed
        (find-assertions query-pattern frame)
        (delay (apply-rules query-pattern frame))))
    frame-stream))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
    the-empty-stream
    (interleave-delayed
      (qeval (first-disjunct disjuncts) frame-stream)
      (delay (disjoin (rest-disjuncts disjuncts)
                      frame-stream)))))

; By not delaying the stream operations, Louis' version does not
; account for queries where the rules and assertions will rely on
; each other. In his version, the rules will be applied to the stream
; when it is appended, meaning that the assertions will not be present
; yet.
; There is a similar problem with disjoin in that the evaluation of
; the first-disjunct will not be available for the recursive disjoin.
