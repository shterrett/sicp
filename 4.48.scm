(define adjectives '(adjective green old cute soft))


(define (parse-noun-phrase)
  (define (maybe-extend noun-phrase)
    (amb noun-phrase
         (maybe-extend (list 'noun-phrase
                             (parse-adjective-phrase)
                             noun-phrase
                             (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))

(define (parse-adjective-phrase)
  (list 'adjective-phrase
        (parse-word adjective)))

