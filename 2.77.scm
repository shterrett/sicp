; Within the complex number package, numbers are tagged
; as either rectangular or polar. The magnitude, angle, real, and imag
; part selectors are indexed in the function table based on the
; polar/rect tag. Calling magnitude on a number that has 'complex as the
; outer tag does not find a function definition in the table. Alyssa P
; Hacker's additions to the table basically strip the 'complex tag
; off of the numbers and allow the selectors defined for 'rect and 'polar
; to take care of the operations. They will be found on lookup becuase
; the second tag of the numbers is either 'rect or 'polar
