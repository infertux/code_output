class CoffeeMachine

  # block
  # comment

  def initialize # inline comment
    p __method__
    # noop
    # noop
  end

  def make!
    p __method__
    puts "DONE"
  end

  def sugar?
    false
  end

  p __method__

end

cm = CoffeeMachine.new
cm.make!
p cm.sugar? # nope

