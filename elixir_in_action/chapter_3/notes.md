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
