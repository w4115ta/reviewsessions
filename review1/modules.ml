(* modules give us a means of encapsulating data
 *)

module type MATH = sig
  val double : int -> int
  val triple : int -> int
  val add : int -> int -> int
end

module IMP : MATH =
  struct
    let double n = n * 2
    let triple n = n * 3
    let add a b = a + b
  end
     
let x = IMP.double 5
