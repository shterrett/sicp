(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define set1 (list 1 2 3 4 5))
(define set2 (list 3 4 5 6 7))

(union-set set1 set2)
(intersection-set set1 set2)

; adjoin is more efficent, and element-of-set? has
; the potential to be both more and less efficent because
; an element appearing multiple times might appear earlier
; in the list. However, the probability is still random,
; and is offset by the length.
; intersection-set and union-set will both be slightly less
; efficent simply because the same set will be longer,
; requiring more recursions.
