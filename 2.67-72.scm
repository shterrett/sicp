(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch
              (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
                (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (encode-symbol sym tree)
  (define (included? sym branch-symbols)
    (cond ((null? branch-symbols) #f)
          ((eq? (car branch-symbols) sym) #t)
          (else (included? sym (cdr branch-symbols)))))
  (cond ((and (leaf? tree) (eq? (symbol-leaf tree) sym)) '())
        ((included? sym (symbols (left-branch tree))) (append '(0) (encode-symbol sym (left-branch tree))))
        ((included? sym (symbols (right-branch tree))) (append '(1) (encode-symbol sym (right-branch tree))))
        (else (error "404 Symbol Not Found" sym))))

(define (encode message tree)
  (if (null? message) '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define sample-plaintext '(a d a b b c a))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)

(encode sample-plaintext sample-tree)

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                             (cadr pair))
                  (make-leaf-set (cdr pairs))))))

(define (successive-merge ordered-pairs)
  (define (build-tree tree pairs)
    (if (null? pairs) tree
      (build-tree (make-code-tree tree (car pairs))
                  (cdr pairs))))
  (build-tree (make-code-tree (car ordered-pairs) (cadr ordered-pairs)) (cdr ordered-pairs)))


(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define pair-list '((A 4) (B 2) (C 1) (D 1)))
(generate-huffman-tree pair-list)

(define rock-lyrics '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))
(define rock-tree (generate-huffman-tree rock-lyrics))
(define rock-message '(Get a job
                           Sha na na na na na na na na
                           Get a job
                           Sha na na na na na na na na
                           Wah yip yip yip yip yip yip yip yip yip 
                           Sha boom
                           ))
(define coded-rock-message (encode rock-message rock-tree))
(length coded-rock-message)
; 89 bits to encode this message
; fixed-length: log2(n)/symbol => log2(8) => 3
; message length is 36 symbols => 108 bits

; For tree where each successive symbol i has weight 2^(i-1)
; for i = 1 -> n (number of symbols)
; The largest weighted symbol would require 1 bit to encode because it
; will always live directly off the root. The smallest symbol will require
; (n-1) bits to encode. The right branch of the tree is always a leaf,
; because the branch formed by the two smallest weights will always have
; a weight less than the weight of the next leaf. This implies a 'level'
; for each leaf, except the first level, which contains two => (n-1) levels.
; Each level will encode one bit, giving a maximum of (n-1)

; encode-symbol grows as O(nlog2(n)) - the included? procedure
; that tests for inclusion in a list is O(n)
; and the actual tree walk for each symbols is O(log2(n)) because
; it's a binary tree. Each time the tree is walked, the leaves are
; searched, so the order of growth is a product of the two.
