
type b = B of (b -> b -> b)

let true'  : b = B (fun x y -> x)
let false' : b = B (fun x y -> y)

let and' (B p) (B q) =
  p (B q) (B p)

let or'  (B p) (B q) =
  p (B p) (B q)
    
