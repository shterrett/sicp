start
  (goto (label here))
here
  (assign a (const 3))
  (goto (label there))
here
  (assign a (const 4))
  (goto (label there))
there

; a => 4
; The later here overwrites the earlier when labels extracted

(define (extract-labels text receive)
  (if (null? text)
    (receive '() '())
    (extract-labels (cdr text)
      (lambda (insts labels)
        (let ((next-int (car text)))
          (if (symbol? next-inst)
            (if (null? (get-label-entry next-int))
                 (receive insts
                          (cons (make-label-entry next-inst
                                                  insts)
                                labels))
                 (receive (cons (make-instruction next-inst)
                                insts)
                          labels)
                 (error "ALREADY USED LABEL" label)
                 )))))))
