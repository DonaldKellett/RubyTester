require_relative "class.test"

test = Test.new

test.describe "RubyTester" do
  test.it "should have a working 'it' method" do
    puts "Inside the 'it' block"
    puts "No error will be thrown from this block"
  end
  test.it "should have an 'it' method that handles errors properly" do
    puts "About to throw an error"
    raise "My Custom Error"
  end
  test.it "should have an 'it' method that handles errors properly" do
    puts "About to throw an error"
    raise "My Custom Error"
  end
  test.it "should have an 'it' method that handles errors properly" do
    puts "About to throw an error"
    raise "My Custom Error"
  end
  test.it "should have a working 'it' method" do
    puts "Inside the 'it' block"
    puts "No error will be thrown from this block"
  end
  test.it "should have an 'it' method that handles ordinary code execution properly" do
    100000.times do |i|
      puts i + 1
    end
  end
  raise "Error directly in 'describe' block"
end
