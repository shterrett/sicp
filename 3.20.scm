; x => 1 | 2
;
; z => x | x
; z => 1 | 2 || 1 | 2
;
; (cdr z) == x; set-car! mutates 1 -> 17
;
; z => 17 | 2 || 17 | 2
; x => 17 | 2
