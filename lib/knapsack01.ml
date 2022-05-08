type item = { weight : int; value : int }

let max_value capacity current_item_weight item_values item matrix =
  let item_value = List.nth item_values (item - 1) in
  let remaining_capacity = capacity - current_item_weight in
  item_value + matrix.(item - 1).(remaining_capacity)

let item_weight items idx =
  let item = List.nth items idx in
  item.weight

let values items = List.map (fun x -> x.value) items

let calculate_knapsack total_weight (items : item list) =
  let n = List.length items in
  let matrix = Array.make_matrix (n + 1) (total_weight + 1) 0 in
  let item_values = values items in
  for item = 1 to n do
    for capacity = 1 to total_weight do
      let max_value_without_item = matrix.(item - 1).(capacity) in
      let current_item_weight = item_weight items (item - 1) in
      let current_item_max_value =
        if capacity >= current_item_weight then
          max_value capacity current_item_weight item_values item matrix
        else 0
      in
      let value = Int.max max_value_without_item current_item_max_value in
      matrix.(item).(capacity) <- value
    done
  done;
  matrix.(n).(total_weight)
