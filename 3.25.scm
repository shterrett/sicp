(define (assoc eq-test key records)
  (cond ((eq? '() records) #f)
        ((eq-test key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (make-table eq-key)
  (let ((local-table (list '*table*)))
    (define (lookup key-list)
      (define (iter-lookup key-list table)
        (let ((subtable (assoc eq-key (car key-list) (cdr local-table))))
          (cond ((eq? '() (cdr key-list))
                (if subtable
                  (let ((record (assoc eq-key key-2 (cdr subtable))))
                    (if record
                      (cdr record)
                      false))
                  false))
                (else (iter-lookup (cdr key-list) subtable))
    (define (insert! key-1 key-2 value)
      (define (iter-insert! key-list value table)
        (let ((subtable (assoc eq-key (car key-list) (cdr local-table))))
          (cond ((eq? '() (cdr key-list))
                 (if subtable
                   (let ((record (assoc eq-key key-2 (cdr subtable))))
                     (if record
                       (set-cdr! record value)
                       (set-cdr! subtable
                                 (cons (cons (car key-list) value)
                                       (cdr subtable)))))
                   (set-cdr! local-table
                             (cons (list key-1
                                         (cons key-2 value))
                                   (cdr local-table)))))
                (else (iter-insert! (cdr key-list) value subtable)))
          'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation --TABLE" m))))
    dispatch))
