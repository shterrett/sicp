; if we keep the representation of term the same
; ie (order, coeff) as in ex 2.89
; we have to tag each term-list as sparse or dense
; Then install the constructors found in section
; 2.5.3 and ex 2.89 into a lookup table with an
; apply generic method that will read the tag and use
; the proper selectors
