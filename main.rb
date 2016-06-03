require_relative "class.test"

test = Test.new

test.describe "My Custom Description" do
  10000.times do |i|
    puts i
    raise "An error"
  end
  10.times do |j|
    puts j
  end
end
