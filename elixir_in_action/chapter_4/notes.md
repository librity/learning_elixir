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
> Record.extract(:file_info, from_lib: "kernel/include/file.hrl")

defmodule MyModule do
  require Record
  Record.defrecord(:user, name: "john", age: 25)

  @type user :: record(:user, name: String.t(), age: integer)
  # expands to: "@type user :: {:user, String.t(), integer}"
end
```

- https://hexdocs.pm/elixir/Record.html

### Data transparency

```elixir
> Fraction.new(1, 4) |>  IO.inspect() |> Fraction.value()
%Fraction{deno: 4, num: 1}
0.25

> mapset = MapSet.new([:monday, :tuesday])
#MapSet<[:monday, :tuesday]>
> IO.puts(inspect(mapset, structs: false))
%{__struct__: MapSet, map: %{monday: [], tuesday: []}, version: 2}

> IO.puts(inspect(~D[2018-12-19], structs: false))
%{__struct__: Date, calendar: Calendar.ISO, day: 19, month: 12, year: 2018}
> IO.puts(inspect(~N[2018-12-19 20:02:01], structs: false))
%{__struct__: NaiveDateTime, calendar: Calendar.ISO, day: 19, hour: 20, microsecond: {0, 0}, minute: 2, month: 12, second: 1, year: 2018}
```

- The only complex types are tuples, lists, and maps.

### Immutable hierarchical updates

```elixir
> todo_list = %{
    1 => %{date: ~D[2018-12-19], title: "Dentist"},
    2 => %{date: ~D[2018-12-20], title: "Shopping"},
    3 => %{date: ~D[2018-12-19], title: "Movies"}
  }
> put_in(todo_list[3].title, "Theater")
%{
  1 => %{date: ~D[2018-12-19], title: "Dentist"},
  2 => %{date: ~D[2018-12-20], title: "Shopping"},
  3 => %{date: ~D[2018-12-19], title: "Theater"}
}

> path = [2, :title]
> put_in(todo_list, path, "Theater")
%{
  1 => %{date: ~D[2018-12-19], title: "Dentist"},
  2 => %{date: ~D[2018-12-20], title: "Theater"},
  3 => %{date: ~D[2018-12-19], title: "Movies"}
}
```

- https://hexdocs.pm/elixir/Access.html

###

```elixir

```

###

```elixir

```

###

```elixir

```

###

```elixir

```

###

```elixir

```

###

```elixir

```
