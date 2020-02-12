(** Let's get the length of a list! *)

let rec len = fun l ->      (* A lambda *)
  match l with              (* Explicit match expression using lambda bound variable *)
    | x::xs -> 1 + len xs
    | [] -> 0

let rec len_ l =            (* Function definition with an argument name *)
  match l with              (* Explicit match expression using arg bound variable *)
    | x::xs -> 1 + len_ xs
    | [] -> 0

let rec len__ = function    (* Pattern matching implicit arg with `function` *)
    | [] -> 0
    | x::xs -> 1 + len__ xs

let rec len___ = function
    | x::xs -> 1 + len___ xs
    | _ -> 0                (* Wildcard to catch all other cases *)

let rec len____ = function  (* Broken implementation; why? *)
    | _ -> 0            
    | x::xs -> 1 + len____ xs

(* Always read documentation to see if there's already a library function doing what you want to do *)
let len_____ = List.length  
