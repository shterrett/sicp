(define count 0)

(define (id x)
  (set! count (+ count 1))
  x)

(define w (id (id 10)))

;> count
;; 0

;> w
;; 10

;>count
;; 2


; Because w is not evaluated until it is called,
; count is not incremented in the beginning. Once w is called
; then id is evaluated twice and count is incremented.
