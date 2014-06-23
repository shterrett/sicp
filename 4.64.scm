; Original Version
(rule (outranked-byj ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (supervisor ?staff-person ?middle-manager)
               (outranked-by ?middle-manager ?boss))))




; Ben's Version
(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager ?boss)
               (supervisor ?staff-person ?middle-manager))))

(outranked-by (Bitdiddle Ben) ?who) ; => inifinite loop

; Ben's version will evaluate the outranked-by recursion before it evaluates
; supervisor in the and clause. Because the result set has not been filtered by
; the supervisor clause yet, outranked-by can pick up (Bitdiddle Ben) for
; ?middle-manager
