
let () =
  let open Knapsack01 in
  let total_weight = 10 in
  let items =
    List.map
      (fun (value, weight) -> { weight; value })
      [ (10, 5); (40, 4); (30, 6); (50, 3) ]
  in
  let result = calculate_knapsack total_weight items in
  Printf.printf "Best result %i\n%!" result
