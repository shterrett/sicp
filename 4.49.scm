(define (parse-word word-list)
  (let ((found-word (sample word-list)))
    (list (car word-list) found-word)))

(define (sample lst)
  (let ((len (length lst)))
    (list-ref lst (random len))))
