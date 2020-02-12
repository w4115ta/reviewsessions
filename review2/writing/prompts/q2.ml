type 'a node =
    | One of 'a
    | Many of 'a node list;;

(** Write a function `flatten` that flattens this nested list structure *)
