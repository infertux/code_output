class Bird
  def has_wings?
    true
  end
end

class Duck < Bird
  def quack
    puts "QUACK!" #=> QUACK! #=> QUACK!
  end
end

duck = Duck.new
p duck.has_wings? #=> true
duck.quack
Duck.new.quack

