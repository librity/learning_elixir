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
> one_half = %Fraction{num: 1, deno: 2}
%Fraction{deno: 2, num: 1}
> one_quarter = %Fraction{one_half | deno: 4}
%Fraction{deno: 4, num: 1}
> operation = Fraction.add(one_half, one_quarter)
%Fraction{deno: 8, num: 6}
> Fraction.value(operation)
0.75

> Enum.to_list(one_half)
** (Protocol.UndefinedError) protocol Enumerable not implemented for %Fraction{deno: 2, num: 1} of type Fraction (a struct)
> Enum.to_list(%{a: 1, b: 2})
[a: 1, b: 2]
> Map.to_list(one_half)
[__struct__: Fraction, deno: 2, num: 1]
```

- https://en.wikipedia.org/wiki/Fraction

### Records

```elixir
> require Record
Record
> Record.is_record({User, "john", 27})
true

defmodule MyModule do
  require Record
  Record.defrecord(:user, name: "john", age: 25)

  @type user :: record(:user, name: String.t(), age: integer)
  # expands to: "@type user :: {:user, String.t(), integer}"
end
```

- https://hexdocs.pm/elixir/Record.html

###

```elixir

```
