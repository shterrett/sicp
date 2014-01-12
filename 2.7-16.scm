(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (lower-bound y) (lower-bound x))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))

; 2.7
(define (make-interval lb ub)
  (cons lb ub))

(define (upper-bound interval)
  (cdr interval))
(define (lower-bound interval)
  (car interval))

; 2.8
(define (sub-interval x y)
  (add-interval x
                  (make-interval (- 0.0 (upper-bound y))
                                 (- 0.0 (lower-bound y)))))

; 2.9
(define (width i)
  (+ (- (upper-bound i) (lower-bound i))
     2))

; i = [li, ui]
; j = [lj, uj]
; wi = (ui - li) / 2
; wj = (uj - lj) / 2
; i + j = [(li + lj), (ui + uj)]
; w+ = (u+ - l+) / 2
; w+ = ((ui + uj) - (li + lj)) / 2
; w+ = ((ui - li) + (uj - lj)) / 2
; w+ = (ui - li) / 2 + (uj - lj) / 2
; w+ = wi + wj
; also holds for difference because it's defined in terms of sum
;
; k = (0.5, 2)
; wk = (2 - 1.5) / 2 = 0.75
; l = (1, 3)
; wl = (3 - 1) / 2 = 1
; k * l = (0.5, 2) * (1, 3)
; k * l = (0.5, 6)
; w* = (6 - 0.5) / 2 = 2.75 != wk * wl

; 2.10

(define (div-interval x y)
  (define (spans-0 i)
    (and (< 0 (lower-bound i))
             (> 0 (lower-bound i))))
  (if (or (spans-0 x) (spans-0 y)) (display "Interval spans zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

; 2.11
; Split the combination up into all possible cases
; then write a bunch of (cond ...) statements
; this is a terrible idea
; Ben Bitdiddle should be shot
;
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; 2.12
(define (make-center-percent c p)
  (make-interval (+ c (* p c))
                 (- c (* p c))))

(define (percent-width i)
  (/ (width i)
     (center i)))

; 2.13
; [c1 - c1p1, c1 + c1p1] * [c2 - c2p2, c2 + c2p2]
; [(c1 - c1p1) * (c2 - c2p2), (c1 + c1p1) * (c2 + c2p2)]
; [(c1c2 - c1c2p1 - c1c2p2 + c1c2p1p2), (c1c2 + c1c2p1 + c1c2p2 + c1c2p1p2)]
; [(c1c2 - c1c2(p1 + p2) + c1c2p1p2), (c1c2 + c1c2(p1 + p2) + c1c2p1p2)]
; For small p, p^2 -> 0
; [(c1c2 - c1c2(p1 + p2)), (c1c2 + c1c2(p1 + p2))]

; 2.14

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define res-1 (make-center-percent 10 0.5))
(define res-2 (make-center-percent 5 0.03))

(par1 res-1 res-2)
(par2 res-1 res-2)

; floating point arithmetic is a bitch

; 2.15
; The fewer times a number is calculated, the smaller the error
; in the arithmetic will be
; therefore par2 is the better calculation


; 2.16
; The computer represents floats as the ratio of
; powers of two. They are inherently inaccurate.
; A system to handle accurate decimals requires a construct
; 'Decimal' that converts all numbers to integers and stores
; a known precision. The math is done with integers, which are
; accurate, and the precision is modified with each operation.
; At the end of the calculation, the number is displayed as a
; decimal, using the precision to determine where to place
; the decimal.
