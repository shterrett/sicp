; The print statement prints the contents of the two pointers
; Since they're pointing at the same thing, it gets printed twice
; It still shows after deleted because the rear pointer is still
; pointing to the value

(define (print-queue queue)
  (display (front-queue queue)))
