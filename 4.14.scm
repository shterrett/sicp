; Louis' map is being evaluated in the underlying scheme, which is looking for specific syntax
; The syntax defined for the metacircular evaluator is different
; When scheme tries to parse the arguments to map, it fails because they
; are in the form expected by the metacircular evaluator
; Eva is working entirely in the metacircular evaluator, so all of the syntax
; she is using conforms and the program runs
