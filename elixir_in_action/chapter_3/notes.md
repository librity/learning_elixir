### Patter Matching

```elixir
> {date, time} = :calendar.local_time()
> {year, month, day} = date
> {hour, minute, second} = time
> {_, {hour, _, _}} = :calendar.local_time()
> {amount, amount, amount} = {127, 127, 127}
{127, 127, 127}
> {amount, amount, amount} = {127, 127, 1}
** (MatchError) no match of right hand side value: {127, 127, 1}
# Inefficient way of getting the min value of a list
> [min | _tails] = Enum.sort([3,2,1])
> min
1
> [_, {name, _}, _] = [{"Bob", 25}, {"Alice", 30}, {"John", 35}]
```

- https://hexdocs.pm/elixir/master/patterns-and-guards.html

### Pin Operator

```elixir
> expected_name = "Bob"
"Bob"
> {^expected_name, _} = {"Bob", 25}
{"Bob", 25}
> {^expected_name, _} = {"Alice", 30}
** (MatchError) no match of right hand side value: {"Alice", 30}
```

### Matching bitstrings and binaries

```elixir
> binary = <<1, 2, 3>><<1, 2, 3>>
> <<b1, b2, b3>> = binary
<<1, 2, 3>>
> b2
2
> <<b1, rest :: binary>> = binary
<<1, 2, 3>>
> b1
1
> rest
<<2, 3>>
# You can split bytes into lower and higher bits:
# 155 = 10011011; 9 = 1001; 11 = 1011
> <<a :: 4, b :: 4>> = << 155 >>
<< 155 >>
> a
9
> b
11
```

### Matching binary strings

```elixir
# Better use the String module for String matching
> <<b1, b2, b3>> = "ABC"
"ABC"
> b1
65
> b2
66
> command = "ping www.example.com"
> "ping " <> url = command
"ping www.example.com"
> url
"www.example.com"
```

### Compound matches

```elixir
> a = (b = 1 + 3)
4
> a = b = 1 + 3
4
> date_time = {_, {hour, _, _}} = :calendar.local_time()
> {_, {hour, _, _}} = date_time = :calendar.local_time()
> date_time
{{2018, 11, 11}, {21, 32, 34}}
> hour
21
```

### Multiclause function

```elixir

defmodule Geometry do
  def area({:rectangle, a, b}), do: a * b
  def area({:square, a}), do: a * a
  def area({:circle, r}), do: r * r * 3.14
  def area(unknown), do: {:error, {:unknown_shape, unknown}}
end

> Geometry.area({:rectangle, 4, 5})
20
> Geometry.area({:square, 5})
25
> Geometry.area({:circle, 4})
50.24
> Geometry.area({:triangle, 1, 2, 3})
{:error, {:unknown_shape, {:triangle, 1, 2, 3}}}

> fun = &Geometry.area/1
> fun.({:circle, 4})
50.24
> fun.({:square, 5})
25
```

### Guards

```elixir
defmodule TestNum do
  def test(x) when is_number(x) and x < 0, do: :negative
  def test(0), do: :zero
  def test(x) when is_number(x) and x > 0, do: :positive
end

> TestNum.test(-1)
:negative
> TestNum.test(0)
:zero
> TestNum.test(1)
:positive
> TestNum.test(:not_a_number)
** (FunctionClauseError) no function clause matching in TestNum.test/1

defmodule ListHelper do
  def smallest(list) when length(list) > 0, do: Enum.min(list)
  def smallest(_), do: {:error, :invalid_argument}
end

> ListHelper.smallest([123, 4, 9])
> ListHelper.smallest(123)
```

- https://hexdocs.pm/elixir/guards.html

Operators allowed in Guard:

- `==, !=, ===, !==, >, <, <=, >=`
- `and, or, not, !`
- `+, -, *, /`
- `Kernel.is_number/1`, `Kernel.is_atom/1`, etc.

### Type-order hierarchy

```elixir
number < atom < reference < fun < port < pid <  tuple < map < list < bitstring (binary)
```

### Multiclause lambdas

```elixir
test_num = fn
  x when is_number(x) and x < 0 ->
    :negative

  0 ->
    :zero

  x when is_number(x) and x > 0 ->
    :positive
end

> test_num.(-1)
:negative
> test_num.(0)
:zero
> test_num.(1)
:positive
```

### Branching with multiclause functions

```elixir
defmodule TestList do
  def empty?([]), do: true
  def empty?([_ | _]), do: false
end
```

```elixir
defmodule Polymorphic do
  def double(x) when is_number(x), do: 2 * x
  def double(x) when is_binary(x), do: x <> x
end

> Polymorphic.double(3)
6
> Polymorphic.double("Jar")
"JarJar"
```

```elixir
defmodule Fact do
  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)
end

> Fact.fact(1)
1
> Fact.fact(3)
6
```

```elixir
defmodule ListHelper do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end

> ListHelper.sum([])
0
> ListHelper.sum([1, 2, 3])
6
```

### if and unless

```elixir

```

###

```elixir

```

###

```elixir

```
