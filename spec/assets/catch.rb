def routine(n)
  puts n
  throw :done if n < 1
  routine(n-1)
end

catch(:done) { routine(3) }

