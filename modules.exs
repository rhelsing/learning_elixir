defmodule Mult do
  defp double(n) do #cant call but quad can
    n*2
  end

  def quad(n), do: double(double(n)) #another format
end

#sweet recursion
defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n-1)
end

defmodule Sum do
  def of(0), do: 0
  def of(n) when n > 0, do: n + of(n-1)
end

defmodule GCD do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x, y)) #rem is like % except it returns with sign of first arg
end

# look for the simplest possible case, one that has
# a definite answer. This will be the anchor.
# Then look for a recursive solution that will end up calling the anchor case.

#cannot use joined boolean expressions in when clause
defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end

  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end

  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end
end
Guard.what_is(99)
Guard.what_is(:cat)
Guard.what_is([1,2,3])
# => 99 is a number
# => cat is an atom
# => [1,2,3] is a list

defmodule Example do
  @constant_var "DOOD"
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end

Example.func("a", "b")
Example.func("a", "b", "c")
Example.func("a", "b", "c", "d")
# => ["a",2,3,"b"]
# => ["a","b",3,"c"]
# => ["a","b","c","d"]

# The defp macro defines a private function—one that can be called only within the module that declares it.

# It is a good idea to use import in the smallest possible enclosing scope and to use only: to import just the functions you need.
import List, only: [ flatten: 1 ]
a = flatten([3,4,[4,5]])
IO.inspect a
