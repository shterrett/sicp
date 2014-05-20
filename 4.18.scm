; choice 1
(lambda (vars)
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (let ((a <e1>)
          (b <e2>))
      (set! u a)
      (set! v b))
    <e3>))

; choice 2
(define (scan-out-defines body)
  (let* ((definitions (filter definition? body))
         (rest-expressions (filter (lambda (expr) (not (definition? expr))) body))
         (vars (map definition-variable definitions))
         (vals (map definition-value definitions)))
    (define (make-unassigned-binding var)
      (list var '*unassigned*))
    (define (make-assignment var val)
      (list 'set! var val))
    (append (list 'let
                  (map make-unassigned-binding vars))
            (map make-assignment vars vals)
            rest-expressions)))

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

; in choice 1, a is not available to b, so the definition will not work.
; In choice 2, the assignments are happening simultaneously(ish)
; and the definitions will be available to each other.
