(define (make-mobile left right)
  (cons left right))

(define (make-branch len structure)
  (cons len structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (total-weight mobile)
  (if (not (pair? (right-branch mobile))) (right-branch mobile)
    (+ (total-weight (left-branch mobile)) (total-weight (right-branch mobile)))))

(define (total-torque mobile)
  (if (not (pair? (right-branch mobile))) (* (left-branch mobile) (right-branch mobile))
    (+ (total-torque (left-branch mobile)) (total-torque (right-branch mobile)))))

(define branch-1 (make-branch 2 5))
(define branch-2 (make-branch 1 4))
(define mobile (make-mobile branch-1 branch-2))
(left-branch mobile)
(right-branch mobile)
(total-weight mobile)

(define (balanced? mobile)
  (= (total-torque (left-branch mobile)) (total-torque (right-branch mobile))))

(define branch-3 (make-branch 5 2))
(define branch-4 (make-branch 4 1))
(define balanced-mobile (make-mobile (make-mobile branch-1 branch-4)
                                     (make-mobile branch-2 branch-3)))
(define unbalanced-mobile (make-mobile (make-mobile branch-1 branch-1)
                                       (make-mobile branch-2 branch-2)))
(balanced? balanced-mobile)
(balanced? unbalanced-mobile)

; change the right-branch accessor to account for the lack of null list
; change the list? checks to pair?
