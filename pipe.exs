# The |> operator takes the result of the expression to its left and inserts it as the first parameter of the function invocation to its right

defmodule Dood do
  def call(a, b, c) do
    IO.inspect [a, b, c]
  end
end

val = "hey"

# val |> f(a,b) is basically the same as calling f(val,a,b), and
val |> Dood.call(3, :s)

IO.inspect (1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))


IO.inspect (100..1000)
  |> Enum.map(&(&1*&1))
  |> Enum.filter(&(&1 < 40000))
  |> Enum.filter(&(&1 > 400))
