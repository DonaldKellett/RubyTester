require_relative "class.test"

test = Test.new

test.describe "RubyTester" do
  test.it "should have a working 'expect' method that passes tests for truthy values" do
    test.expect true
    test.expect true
    test.expect true
    test.expect true
    test.expect true
  end
  test.it "should have a working 'expect' method that fails tests for falsy values" do
    test.expect false
    test.expect false
    test.expect false
  end
end
