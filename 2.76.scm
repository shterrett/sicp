; explicit dispatch - new operations must be added to
; each existing operation so that each one
; can handle every type of tagged data
; this should basically never be used, except for extremely simple
; systems that will never change
;
; data-directed - new operations must be created and indexed in a table
; The new constructor with tags must also be added. Other procedures
; will continue to use the table without needing to be modified.
; If more procedures will be added without adding types, this
; may be preferrable to message-passing because, while the new operations
; will have to be created for each type, they will be added to the table
; and the types will not have to be modified
;
; message-passing - new operations must be added to each type
; When adding new types, this is the best representation because all changes
; are encapsulated in the types, and the rest of the system need not change.
; When new operations are added more frequently than types, each of the types
; will be changing frequently. While data-directed may be more appropriate
; in this situation, the changes are still encapsulated by the types to
; which they apply, and message-passing remains viable.
