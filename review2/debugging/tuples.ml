let check_is_empty tup =
  match tup with
    | (true,y) ->
      match y with
        | [] -> true
        | _ -> false 
    | (false,y) ->
      match y with
        | [] -> false
        | _ -> true
