(fact 3)
(* 3 (fact 2)) ; stack => [3]
(* 3 2 (fact 1)) ; stack => [3 2]
(* 3 2 1) ; stack => [3 2 1]

(fib 3)
(+ (fib 2) (fib 1)) ; stack => [3]
(+ (+ (fib 1) (fib 0)) 1); stack => [3 2]
(+ (+ 1 0) 1) ; stack => [3 2]
