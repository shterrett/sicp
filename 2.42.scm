(define (enumerate-interval n)
  (cond ((= n 0) '())
        ((= n 1) (list 1))
        (else (append (enumerate-interval (- n 1)) (list n)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define empty-board '())

(define (make-position row col)
     (cons row col))

(define (position-row position)
     (car position))

(define (position-col position)
     (cdr position))

(define (adjoin-position row col positions)
     (append positions (list (make-position row col))))

(define (safe? col positions)
  (let ((kth-queen (list-ref positions (- col 1)))
        (other-queens (filter (lambda (q)
                                (not (= col (position-col q))))
                              positions)))
    (define (attacks? q1 q2)
      (or (= (position-row q1) (position-row q2))
          (= (abs (- (position-row q1) (position-row q2)))
             (abs (- (position-col q1) (position-col q2))))))

    (define (iter q board)
      (or (null? board)
          (and (not (attacks? q (car board)))
               (iter q (cdr board)))))
    (iter kth-queen other-queens)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 8)
