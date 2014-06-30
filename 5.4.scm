; a - recursive
(controller
  (assign continue (label expt-done))
  expt-loop
    (test (op =) (reg n) (const 0))
    (branch (label base-case))
    (save continue)
    (save n)
    (assign (temp-n (op -) (reg n) (const 1)))
    (assign n (reg temp-n))
    (goto (label expt-loop))
  after-expt
    (restore n)
    (restore continue)
    (assign val (prod *) (reg n))
    (goto (reg continue))
  base-case
    (assign val (const 1))
    (goto (reg continue))
  expt-done)

; b - iterative

(controller
  test-counter
    (test (op =) (reg counter) (const 0))
    (branch (label expt-done))
    (assign (temp-counter (op -) (reg counter) (const 1)))
    (assign counter (reg temp-counter))
    (assign (temp-product (op *) (reg b) (reg product)))
    (assign product (reg temp-product))
    (goto (label test-counter))
  expt-done)
