; streams are composed of a value cons'd with a promise to
; fetch the remaining values. set! is destructive and will overwrite
; the remaining values. Binding the stream to a variable allows it
; to be preserved during the binding process

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
    (cons-stream assertion THE-ASSERTIONS))
  'ok)

; This definition of add-assertion essentially cause THE-ASSERTIONS
; to consist of an inifite loop of the assertion being set
