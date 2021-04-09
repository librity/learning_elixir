### Modules abstract data types

```elixir
> String.upcase("a string")
"A STRING"

> list = []
[]
> list = List.insert_at(list, -1, :a)
[:a]
> list = List.insert_at(list, -1, :b)
[:a, :b]

> days = MapSet.new() |> MapSet.put(:monday) |> MapSet.put(:tuesday)
> MapSet.member?(days, :monday)
true
```

### Todo List Usage

```elixir
> todo_list =
  Todo.new() |> 
  Todo.add_entry(~D[2018-12-19], "Dentist") |> 
  Todo.add_entry(~D[2018-12-20], "Shopping") |> 
  Todo.add_entry(~D[2018-12-19], "Movies")
> Todo.entries(todo_list, ~D[2018-12-19])
["Movies", "Dentist"]
> Todo.entries(todo_list, ~D[2018-12-18])
[]
```

### Fraction usage

```elixir
> Fraction.add(Fraction.new(1, 2), Fraction.new(1, 4)) |>
  Fraction.value()
0.75
```

### 

```elixir

```

### 

```elixir

```
