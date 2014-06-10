; slower unmemoized
(define (factorial n)
  (if (<= n 1) 1
    (+ (factorial (- n 1)) (factorial (- n 2)))

(define answer (factorial 5))

(* answer answer)

; factorial (which is already slow) will have to be evaluated
; twice if it is not memoized. Because it's so much slower
; than the rest of the program, memoization should effecitvely
; cut the runtime in half.

(define count 0)

(define (square x)
  (* x x))

(define (id x)
  (set! count (+ count 1))
  x)

; memoized
;> (square (id 10))
;; 100

;> count
;; 1

;> count
;; 1

; not memoized
;> (square (id 10))
;; 100

;> count
;; 1

;> count
;; 1
