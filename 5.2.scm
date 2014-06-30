(controller
  test-counter
    (test (op >) (reg counter) (const 1))
    (branch (label factorial-done))
    (assign (t1 (op *) (reg product) (reg counter)))
    (assign (t2 (op + ) (reg counter) (const 1)))
    (assign product (reg t1))
    (assign counter (reg t2))
    (goto (label test-counter))
  factorial-done)
