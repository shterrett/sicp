; Alyssa's procedure defers execution of the procedures
; until runtime, whereas the version in the text
; builds a lambda for each expression at analyze time.
; Alyssa's execute-sequence procedure will have to be analyzed
; at runtime as well, whereas the version in the text returns
; a set of nested lambdas that can be evaluated straightaway.
