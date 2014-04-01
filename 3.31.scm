; If the procedure was not executed immediately upon
; attachment, the inital timestamp would not have displayed.
; In a more complex scenario, this would preclude the ability to have a
; baseline refence that allowed calculating elapsed time
; In general, if a procedure modifies state that is important for the future
; functioning of a wire, and it is not run immediately on attachment,
; than that state is not active until after the next action on the wire.
; In this case, that action would not be influenced by the procedure as intended.
