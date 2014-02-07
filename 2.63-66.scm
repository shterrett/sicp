(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

; both will produce an ordered list (least to greatest)
; both are recursive procedures
; cons is constant time, append is proportional to length
; therefore tree->list-1 is less efficent

(define tree1 (make-tree 7
                         (make-tree 3
                                    (make-tree 1 '() '())
                                    (make-tree 5 '() '()))
                         (make-tree 9 '()
                                    (make-tree 11 '() '()))))

(define tree2 (make-tree 3
                         (make-tree 1 '() '())
                         (make-tree 7
                                    (make-tree 5 '() '())
                                    (make-tree 9
                                               '()
                                               (make-tree 11 '() '())))))

(define tree3 (make-tree 5
                         (make-tree 3
                                    (make-tree 1 '() '())
                                    '())
                         (make-tree 9
                                    (make-tree 7 '() '())
                                    (make-tree 11 '() '()))))

(tree->list-1 tree1)
(tree->list-2 tree1)
(tree->list-1 tree2)
(tree->list-2 tree2)
(tree->list-1 tree3)
(tree->list-2 tree3)

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (non-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-elts))
                (right-result (partial-tree (cdr non-left-elts)
                                            right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts (cdr right-result)))
              (cons (make-tree this-entry left-tree right-tree)
                    remaining-elts))))))))

; partial-tree cuts the list in half (approximately, because it's floored to 
; integer division)
; For each half of the list, it calls itself to get the tree for that half
; Then the two trees and the current point (defined as the first element of the right half)
; are made into a single tree with the make-tree constructor
; O(log(n)) because it halves the list each time

(list->tree (list 1 2 4 5 7 8 9 11 12 13 15 20 25))

(define (union-set-list set1 set2)
  (define (build-set union first second)
    (cond ((null? first) (append union second))
          ((null? second) union)
          ((< (car first) (car second)) (build-set (append union (list (car first)))
                                                (cdr first)
                                                second))
          ((= (car first) (car second)) (build-set (append union (list (car first)))
                                                (cdr first)
                                                (cdr second)))
          ((> (car first) (car second)) (build-set (append union (list (car second)))
                                                first
                                                (cdr second)))))
  (build-set '() set1 set2))

(define (union-set set1 set2)
  (let ((list1 (tree->list-2 set1))
        (list2 (tree->list-2 set2)))
    (let ((union (union-set-list list1 list2)))
      (list->tree union))))

(define tree1 (list->tree (list 1 3 5 7 9)))
(define tree2 (list->tree (list 2 4 6 8 10)))

(union-set tree1 tree2)

(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
    '()
     (let ((x1 (car set1))
           (x2 (car set2)))
       (cond ((= x1 x2)
              (cons x1 (intersection-set-list (cdr set1)
                                         (cdr set2))))
             ((< x1 x2)
              (intersection-set-list (cdr set1)
                                set2))
             ((> x1 x2)
              (intersection-set-list set1
                                (cdr set2)))))))

(define (intersection-set set1 set2)
  (let ((list1 (tree->list-2 set1))
         (list2 (tree->list-2 set2)))
    (let ((intersection (intersection-set-list list1 list2)))
      (list->tree intersection))))

(define tree3 (list->tree (list 1 3 5 7 9)))
(define tree4 (list->tree (list 2 3 5 7 11)))

(intersection-set tree3 tree4)

(define (make-data key value)
  (cons key value))

(define (key data)
  (car data))

(define (value data)
  (cdr data))

(define (lookup-key search-key data-tree)
  (cond ((null? data-tree) '())
        ((= search-key (key (entry data-tree)))
         (value (entry data-tree)))
        ((< search-key (key (entry data-tree)))
         (lookup-key search-key (left-branch data-tree)))
        ((> search-key (key (entry data-tree)))
         (lookup-key search-key (right-branch data-tree)))))
