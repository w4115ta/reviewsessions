
(* now, what if we wanted to have a store of keys of a different type, or values of a different type? *)

type ('a, 'b) store = ('a * 'b) list

(* what about the add function for this store? *)
let add : ('a * 'b) -> ('a, 'b) store -> ('a, 'b) store =
  fun e s ->
  e :: s

let lookup : ('a, 'b) store -> 'a -> 'b option =
  fun s k ->
  match s with
  | [] -> None
  | hd :: tl -> match hd with
                | (k', v) -> if k' = k then (Some v) else (lookup'' tl k)
