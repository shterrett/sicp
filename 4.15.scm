(define (halts? p a)
  (if (it-will-halt? p a)
    #t
    #f))

(define (run-forever)
  (run-forever))

(define (try p)
  (if (halts? p p)
    (run-forever)
    'halted))

(try try)

; this is the classic paradox:
;   The following sentence is true.
;   The preceeding sentance is false.
;
;  try is defined in such a way that if (p p) halts,
;  try will run forever. When (try try) is evaluated, if
;  try halts, try will run forever, and if try does not halt,
;  try will halt. Therefore the system will cause a black hole
;  that begins in the cpu and gradually expands to approximately
;  the size of the programmers desk.
