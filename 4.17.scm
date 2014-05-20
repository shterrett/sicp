; sequential definitions are defined directly in the frame in
; which the procedure is defined
; For scanning-out the internal definitions, the interpretor creates
; a frame within the scan-out-variables method where the internal definitions
; are created, before the body of the procedure is run.
; The extra frame is necessary so there is somewhere to put the definitions
; before the body of the procedure runs and referneces them.
