(define (proc set)
  (lambda (lst)
    (cons (car set) lst)))

(define (subsets s)
  (if (null? s) (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (proc s) rest)))))

(define test (list 1 2 3))
(subsets test)

; subsets finds each of the subsets of the right part of the list
; then, the left part of the list (in proc) is appended to each of the subsets
; as we recurse over the list, each base subset will be generated (ie, each element)
; and then will have the left side appended to it
; the base cases will be generated when the right side of the list is nil
; and the left side is appended to that.
