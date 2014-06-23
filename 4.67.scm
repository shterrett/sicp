; The system needs to keep a record of arguments for each
; query and check that record before beginning another deduction
; with the same set of arguments.
;
; For example - (outranked-by ?staff-person ?boss)
; The system should record
; ('already-tried (outranked-by (Bitdiddle Ben) (Fect Cy D)))
; and when the (outranked-by) call appears again,
; it should check the 'already-tried list for each pair of arguments
