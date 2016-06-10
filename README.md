# RubyTester

[![Join the chat at https://gitter.im/DonaldKellett/RubyTester](https://badges.gitter.im/DonaldKellett/RubyTester.svg)](https://gitter.im/DonaldKellett/RubyTester?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

A simple, custom Ruby TDD framework that requires minimal setup and executes in the command line.  MIT Licensed

## Version Details

- Current Version: `v1.0.2`
- Status: Stable and Production Ready
- License: **MIT License**

## Initialization

In order to initialize the RubyTester and start using it to write your Ruby test cases, simply follow the instructions below:

### I. Including `class.test.rb` in your main Ruby file to be executed

In your main Ruby file to be executed, simply include the following line in your code:

```ruby
require '/path/to/your/class.test.rb'
```

You can also use `require_relative` or load to include the testing framework if necessary.  For example, in the demo provided (`main.rb`), the file uses `require_relative 'class.test'` instead of just `require` as both files are in the same directory.

### II. Creating an instance of `Test`

After you have included the testing framework in your main Ruby file, create a new instance of `Test`, e.g.

```ruby
test = Test.new
```

**... and, you're good to go!**

## Spec Methods

### describe

#### Syntax

```ruby
test = Test.new # In all later examples, we will assume that the instance of Test you created is called 'test'
test.describe msg, &block
```

#### Description

`test.describe` is the top level spec method used to group test cases.  Although not required, it is **highly recommended** that you wrap all of your test cases in the block provided to `test.describe` because it provides useful feedback regarding the number of passes, fails and whether any errors have occurred.  Furthermore, `test.describe` handles any errors within the block provided properly so even if an error is thrown inside the block, any Ruby code that follows the `test.describe` block can execute as normal.

e.g.

```ruby
test.describe "The Multiply Function" do
  # code
end
```

### it

#### Syntax

```ruby
test.it msg, &block
```

#### Description

`test.it` is a spec method designed to be used in conjunction with `test.describe` (usually **nested within the `test.describe` block**) in order to further group test cases into subcategories.  Please note that if you use `test.it` it is highly recommended that you nest the `test.it`s within a `describe` block for maximum effect.

e.g.

```ruby
test.describe "The Multiply Function" do
  test.it "should work for positive integers" do
    # code
  end
  test.it "should work for negative integers" do
    # code
  end
  test.it "should work for positive floats" do
    # code
  end
  test.it "should work for negative floats" do
    # code
  end
end
```

## Pass/Fail Methods

### expect

#### Syntax

```ruby
test.expect passed[, msg[, success]]
```

#### Description

`test.expect` is the most basic of all Pass/Fail methods.  It expects a minimum of one parameter, `passed`, which is a boolean value or a value than can be converted into a boolean.  It passes the test if `passed` is truthy (i.e. anything other than `false` or `nil`) and fails otherwise.  `msg` and `success` are optional.  `msg` is the message displayed to the user upon a failed test and `success` is the message displayed upon a successful test.  If `msg` (or `success`) is not provided a generic message will be used.

### assert_equals

#### Syntax

```ruby
test.assert_equals actual, expected[, msg[, success]]
```

#### Description

`test.assert_equals` expects 2 arguments, `actual` and `expected` and checks if they are equal (`==`).  A test is passed if they are equal; otherwise, it fails.  Again, `msg` and `success` are optional and serve the same puropse as in `test.expect`

### assert_not_equals

#### Syntax

```ruby
test.assert_not_equals actual, unexpected[, msg[, success]]
```

#### Description

Basically the opposite of `test.assert_equals`.  Passes the test if `actual != unexpected` and fails otherwise.

### expect_error

#### Syntax

```ruby
test.expect_error msg, &block
```

#### Description

`test.expect_error` expects exactly 2 arguments, the first one being `msg` (the message displayed to the user upon a failed test) and the second argument being a `&block` to be executed and checked for errors.  The test passes if the code in the block throws an error and fails otherwise.

e.g.

```ruby
test.expect_error "Expected error was not thrown" do
  puts "3 + 2 equals " + (3 + 2) # Cannot implicitly convert FixNum into String - Test Passed
end
test.expect_error "Expected error was not thrown" do
  puts "3 + 2 equals " + (3 + 2).to_s # No error is thrown so the test fails
end
```

### expect_no_error

#### Syntax

```ruby
test.expect_no_error msg, &block
```

#### Description

Basically the opposite of `test.expect_error` - the test passes if **no** errors are thrown from the block being executed and fails otherwise.

## Miscellaneous

### random_number

#### Syntax

```ruby
test.random_number # e.g. 43
```

#### Description

Returns a random integer from `0` to `100` (both inclusive).  Accepts no arguments.

### random_token

#### Syntax

```ruby
test.random_token [length] # e.g. k34mncj7u0
```

#### Description

Returns a randomly generated string consisting of only lowercase letters and/or digits.  Optionally accepts an argument `length` which specifies the length of the random string (token) to be generated.  If not specified then the default string length is `10`.

### randomize (`v1.0.1`+)

#### Syntax

```ruby
test.randomize array
```

#### Description

Expects an `array` as its only argument and returns a new array with the order of the elements randomized.  Does not mutate the original array.

### A note regarding arrays and hashes

As of `v1.0.0`, the direct comparison of arrays and hashes are not supported yet.  For example, if you want to compare an array to an expected (array) result you may want to perform multiple tests, e.g. test for its length before comparing the array elements one by one.
