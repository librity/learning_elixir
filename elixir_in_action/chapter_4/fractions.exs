defmodule Fraction do
  defstruct a: nil, b: nil
end

one_half = %Fraction{a: 1, b: 2}
operation = Fraction.add(Fraction.new(1, 2), Fraction.new(1, 4))
Fraction.value(operation)
