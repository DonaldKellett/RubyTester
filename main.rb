require_relative "class.test"

test = Test.new

=begin
test.describe "RubyTester" do
  test.it "should have a working 'assert_equals' method" do
    # Passing Tests with Default Message
    test.assert_equals 1, 1
    test.assert_equals 0, 0
    test.assert_equals true, true
    test.assert_equals false, false
    test.assert_equals "Hello World", "Hello World"
    # Passing Tests with Custom Message
    test.assert_equals 1, 1, "", "PERFECT"
    test.assert_equals 0, 0, "", "PERFECT"
    test.assert_equals true, true, "", "PERFECT"
    test.assert_equals false, false, "", "PERFECT"
    test.assert_equals "Hello World", "Hello World", "", "PERFECT"
    # Failing Tests with Default Message
    test.assert_equals 1, "1"
    test.assert_equals "0", 0
    test.assert_equals "true", true
    test.assert_equals false, "false"
    test.assert_equals "Hello World", "bacon"
    # Failing Tests with Custom Message
    test.assert_equals 1, "1", "EPIC FAIL"
    test.assert_equals "0", 0, "EPIC FAIL"
    test.assert_equals "true", true, "EPIC FAIL"
    test.assert_equals false, "false", "EPIC FAIL"
    test.assert_equals "Hello World", "bacon", "EPIC FAIL"
  end
  test.it "should have a working 'assert_not_equals' method" do
    # Passing Tests with Default Message
    test.assert_not_equals 1, "1"
    test.assert_not_equals "0", 0
    test.assert_not_equals true, "true"
    test.assert_not_equals "false", false
    test.assert_not_equals "bacon", "Hello World"
    # Passing Tests with Custom Message
    test.assert_not_equals 1, "1", "", "Bravo! :)"
    test.assert_not_equals "0", 0, "", "Bravo! :)"
    test.assert_not_equals true, "true", "", "Bravo! :)"
    test.assert_not_equals "false", false, "", "Bravo! :)"
    test.assert_not_equals "bacon", "Hello World", "", "Bravo! :)"
    # Failing Tests with Default Message
    test.assert_not_equals 1, 1
    test.assert_not_equals 0, 0
    test.assert_not_equals true, true
    test.assert_not_equals false, false
    test.assert_not_equals "Hello World", "Hello World"
    # Failing Tests with Custom Message
    test.assert_not_equals 1, 1, "Miss :p"
    test.assert_not_equals 0, 0, "Miss :p"
    test.assert_not_equals true, true, "Miss :p"
    test.assert_not_equals false, false, "Miss :p"
    test.assert_not_equals "Hello World", "Hello World", "Miss :p"
  end
  test.it "should have a working 'expect_error' method" do
    # Passing Tests
    test.expect_error "Expected error was not thrown" do
      100000.times do
        puts "Hello World"
        puts "3 + 2 equals " + (3 + 2)
      end
    end
    test.expect_error "Expected error was not thrown" do
      puts "abcdefghijklmnopqrstuvwxyz".to_a
    end
    # Failing Tests
    test.expect_error "Expected error was not thrown" do
      100000.times do |i|
        puts i
      end
    end
    test.expect_error "Expected error was not thrown" do
      puts "3 + 2 equals " + (3 + 2).to_s
    end
  end
  test.it "should have a working 'expect_no_error' method" do
    # Passing Tests
    test.expect_no_error "Expected error was not thrown" do
      100000.times do |i|
        puts i
      end
    end
    test.expect_no_error "Expected error was not thrown" do
      puts "3 + 2 equals " + (3 + 2).to_s
    end
    # Failing Tests
    test.expect_no_error "Unexpected error thrown" do
      100000.times do
        puts "Hello World"
        puts "3 + 2 equals " + (3 + 2)
      end
    end
    test.expect_no_error "Unexpected error thrown" do
      puts "abcdefghijklmnopqrstuvwxyz".to_a
    end
  end
end
=end

test.describe "RubyTester" do
  test.it "should have a working random_number method" do
    50000.times do
      rand_num = test.random_number
      puts rand_num
      test.expect rand_num >= 0 && rand_num <= 100
    end
  end
  test.it "should have a working 'random_token' method" do
    10000.times do
      rand_str = test.random_token
      puts rand_str
      test.expect rand_str.length == 10
    end
    10000.times do
      rand_str = test.random_token 1
      puts rand_str
      test.expect rand_str.length == 1
    end
    10000.times do
      rand_str = test.random_token 5
      puts rand_str
      test.expect rand_str.length == 5
    end
    10000.times do
      rand_str = test.random_token 20
      puts rand_str
      test.expect rand_str.length == 20
    end
    10000.times do
      rand_str = test.random_token 50
      puts rand_str
      test.expect rand_str.length == 50
    end
  end
  test.it "should have a working \"randomize\" method that does not mutate the original array" do
    original = (0...10).to_a
    puts "Original Array: #{original}"
    100.times do
      puts "Randomized Array: #{test.randomize original}"
    end
    puts "Original Array: #{original}"
  end
end
