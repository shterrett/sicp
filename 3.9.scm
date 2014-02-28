(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

; frame ----------------------
; n = 6
; (factorial (- n 1)) = (factorial 5)
; frame ---------------------
; n = 4
; (factorial (- n 1)) = (factorial 3)
; frame ---------------------
; n = 3
; (factorial (- n 1)) = (factorial 2)
; frame ---------------------
; n = 2
; (factorial (- n 1)) = (factorial 1)
; frame ---------------------
; n = 1
;  result = 1
;
; walk back up frames ....

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product count max-count)
  (if (> counter max-count)
    product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))

; frame ---------------------
; product = 1
; count = 1
; max-count = 6
; frame ---------------------
; product = 1
; count = 2
; max-count = 6
; frame ---------------------
; product = 2
; count = 3
; max-count = 6
; frame ---------------------
; product = 6
; count = 4
; max-count = 6
; frame ---------------------
; product = 24
; count = 5
; max-count = 6
; frame ---------------------
; product = 120
; count = 6
; max-count = 6
; frame ---------------------
; product = 720
; count = 7
; max-count = 6
