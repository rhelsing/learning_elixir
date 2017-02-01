sum = fn (a, b) -> a + b end
sum2 = fn a, b -> a + b end #can ommit ()
result = sum.(1, 2)
IO.puts result
result = sum2.(1, 4) #was able to overwrite??
IO.puts result

greet = fn -> IO.puts "Hello" end
greet.()

swap = fn { a, b } -> { b, a } end #via pattern matching

result2 = swap.( { 6, 8 } )
# IO.puts result2

list_concat = fn a, b -> a ++ b end
list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]

# sum_array = fn a -> Enum.reduce(a, 0, fn(x, acc) -> x + acc end) end
sum_array = fn a -> Enum.reduce(a, 0, &(&1+&2)) end #same thing
# sum_array = &(Enum.reduce(&1, 0, &(&1+&2))) #nested captures via & are not allowed *.*
IO.puts sum_array.([1,2,3,5,6,22])

handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("./readme.md"))
IO.puts handle_open.(File.open("nope.nope")) #error

#Cool:
add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2)
add_five = add_n.(5)
add_two.(3) #5
add_five.(7) #12


#like a block
times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6) #12

add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
add_one.(44) #&1, &2, and so on correspond to the first, second, and subsequent parameters
