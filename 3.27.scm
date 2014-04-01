; It would not work if memo-fib was defined as (memoize fib)
; because fib would not then call the memoized version of itself
; and all of the intermediate values would not be memoized
;
; the method is called in a context where the table exists
; for each iteration of the method, a value is inserted in the table
; the environment pointer does not change, but the values of variables
; stored within the table is mutated.
