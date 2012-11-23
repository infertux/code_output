def routine(n)
  puts n #=> 3 #=> 2 #=> 1 #=> 0
  throw :done if n < 1
  routine(n-1)
end

catch(:done) { routine(3) }

