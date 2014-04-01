; in an and-gate, the and-action-procedure is added to wire a1 first,
; and then added to wire a2. If both wires invert signal from (1, 0),
; the procedure will be called once for each wire, inserting a lambda
; into the agenda. Assuming a1 changes first, its lambda will be inserted first
; and a2's will be inserted second. Both of these lambdas set the output
; based on the state of the system when they are called. The lambda for
; a2 is called when teh system reaches its final state, whereas the lambda for
; a1 is called at an intermediate state (0, 0). If they were evaluated
; last-in-first-out, a1 would be evaluated last, and set the system to the
; result of the intermediate configuration. a2 should override this because it
; has more recent information about the state of the system.
