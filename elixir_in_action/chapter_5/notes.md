### Working with processes

```elixir
run_query = fn query_def ->
  Process.sleep(2000)
  "#{query_def} result"
end

run_query.("query 1")
Enum.map(1..5, &run_query.("query #{&1}"))
spawn(fn -> IO.puts(run_query.("query 1")) end)

# Spawn a process for each query to run them concurrently
async_query = fn query_def -> spawn(fn -> IO.puts(run_query.(query_def)) end) end
async_query.("query 1")
Enum.each(1..5, &async_query.("query #{&1}"))
```

### Message passing

```elixir
send(self(), "a message")

receive do
  message -> IO.inspect(message)
end

send(self(), {:message, 1})

receive do
  {:message, id} -> IO.puts("received message #{id}")
end

# A process waits until it recieves something that matches any pattern
receive do
  message -> IO.inspect(message)
end

send(self(), {:message, 1})

receive do
  {_, _, _} -> IO.puts("received")
end

# Unless you specify a time limit
receive do
  message -> IO.inspect(message)
after
  5000 -> IO.puts("message not received")
end
```

### Receive algorithm

```elixir
send(self(), {:message, 1})

receive_result =
  receive do
    {:message, x} -> x + 2
  end

IO.inspect(receive_result)
```

### Collecting query results

```elixir
run_query = fn query_def ->
  Process.sleep(2000)
  "#{query_def} result"
end

async_query = fn query_def -> spawn(fn -> IO.puts(run_query.(query_def)) end) end

async_query = fn query_def ->
  caller = self()
  spawn(fn -> send(caller, {:query_result, run_query.(query_def)}) end)
end

Enum.each(1..5, &async_query.("query #{&1}"))

get_result = fn ->
  receive do
    {:query_result, result} -> result
  end
end

results = Enum.map(1..5, fn _ -> get_result.() end)

1..5 |> Enum.map(&async_query.("query #{&1}")) |> Enum.map(fn _ -> get_result.() end)
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
