(sum ?amount
     (and (job ?x (computer programmer))
          (salary ?x ?amount)))

(accumulation-function <variable>
                       <query>)

; Ben has just realized that his queries are not guaranteed to return unique
; responses and so his accumulator will double-count some values
; in a non-trivially predictable way.
;
; To salvage his scheme, Ben needs to impose a uniqueness constraint on records
; returned from the database. Often this will be the person that the record
; pertains to, but that can be ambiguous in come cases (supervisor, for instance)
; and so he will have to specificy the field to be used for the uniqueness
; constraint.
