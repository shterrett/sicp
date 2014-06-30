; With cool primitives

(controller
  test-guess
    (test (op good-enough?) (reg diff-guess) (const 0.001))
    (branch (label sqrt-done))
    (assign (new-guess (op improve) (reg guess) (reg x)))
    (assign new-guess (reg guess))
    (goto (label test-guess))
  sqrt-done)

; Expanded

(op good-enough?
    (assign (square-guess (op square) (reg guess)))
    (assign (test-diff (op -) (reg square-guess) (reg x)))
    (test (op <) (reg test-diff) (const 0.001)))

(op improve
    (assign (div-guess (op /) (reg x) (reg guess)))
    (assign (improved-guess (op average) (reg guess)))
    (assign guess (reg improved-guess)))

; substitute these operations with the appropriate labels
; into the controller above
