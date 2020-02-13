
(* naive church booleans *)

let true'  x y = x
let false' x y = y

(* now we can define logical operators, right? *)

let and' p q = p q p
let or'  p q = p p q

