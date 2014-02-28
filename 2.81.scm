; a
; if a coercion between the same types was alloed,
; the program would simply run in an infinite loop, switching
; the types of the two arguments, looking up the function,
; finding nothing, switching the types... etc.
;
; b
; apply-generic will bomb-out if a function is not defined
; for two numbers of the same type, but it will bobmb
; with an error that the types could not be converted.
; Something should catch that the types are equal and
; throw an error at that point if the operation is not found.
;
; c
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (cond (proc (apply proc (map contents args)))
            ((eq? (car type-tags) (cdr type-tags))
             (error "No method for this type", (list op type-tags)))
            (else ; remainder of apply-generic method below
