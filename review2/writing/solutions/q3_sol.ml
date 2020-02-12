(* Define a type for a polymorphic binary tree called `tree`.
 * All internal nodes should be able to hold data.
 *)

type 'a tree =
    | Nil
    | Node of 'a * 'a tree * 'a tree
