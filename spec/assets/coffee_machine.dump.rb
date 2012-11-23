class CoffeeMachine

  # block
  # comment

  def initialize # inline comment
    p __method__ #=> :initialize
    # noop
    # noop
  end

  def make!
    p __method__ #=> :make!
    puts "DONE" #=> DONE
  end

  def sugar?
    false
  end

  p __method__ #=> nil

end

cm = CoffeeMachine.new
cm.make!
p cm.sugar? # nope #=> false

