class Bird
  def has_wings?
    true
  end
end

class Duck < Bird
  def quack
    puts "QUACK!"
  end
end

duck = Duck.new
p duck.has_wings?
duck.quack
Duck.new.quack

