
(* let's implement a simple key-value store!
   we'll start with integer keys and string values
   
   we can represent a value associated to a key as a pair of the form (key, value)

   let's write a type for this: *)

type entry = int * string

(*
   with this in mind, a store is just a list of keys and values:
 *)

type store = entry list

(*
  let's write a function to add an entry to the store:
 *)

let add : entry -> store -> store =
  fun e s ->
  e :: s

(*
  here's an example store:
 *)

let example_store = [ (1, "foo") ; (2, "bar") ]
let example_store' = add (3, "baz") example_store

(* now let's write a function to look up a key in the store *)

let rec lookup : store -> int -> string =
  fun s k ->
  match s with
  | [] -> raise Not_found
  | hd :: tl -> match hd with
                | (k', v) -> if k' = k then v else (lookup tl k)

(* this is great, but what if we don't want the program to crash if a key isn't found?
   we need some way of representing the possibility that the key wasn't found...
 *)

type result =
  | NotFound
  | Result of string

let rec lookup' : store -> int -> result =
  fun s k ->
  match s with
  | [] -> NotFound
  | hd :: tl -> match hd with
                | (k', v) -> if k' = k then (Result v) else (lookup' tl k)

(* this result type looks a lot like the standard "option" type... *)
type 'a option =
  | None
  | Some of 'a

let rec lookup'' : store -> int -> string option =
  fun s k ->
  match s with
  | [] -> None
  | hd :: tl -> match hd with
                | (k', v) -> if k' = k then (Some v) else (lookup'' tl k)
