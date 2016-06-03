require_relative "class.test"

test = Test.new

test.describe "RubyTester" do
  test.it "should have a working 'assert_equals' method that passes tests when the actual value matches the expected value" do
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
end
