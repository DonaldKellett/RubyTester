=begin
  RubyTester Demo
  For the actual testing framework please refer to `class.test.rb`
=end

require_relative "class.test"

test = Test.new

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
  test.it "should have a working \"assert_similar\" method" do
    # Passing Tests
    test.assert_similar [], []
    test.assert_similar (1..1000).to_a, (1..1000).to_a
    test.assert_similar({"hello" => "world", :bacon => "is delicious"}, {"hello" => "world", :bacon => "is delicious"})
    test.assert_similar({:array => [2, 4, 6, 8, 10], :hash => {:hello => :world}}, {:array => [2, 4, 6, 8, 10], :hash => {:hello => :world}})
    test.assert_similar({
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ]
                }
              }
            }
          }
        }
      }
    }, {
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ]
                }
              }
            }
          }
        }
      }
    })
    # Failing Tests
    test.assert_similar [], [[[]]]
    test.assert_similar [[[]]], []
    test.assert_similar({:hello => "world", :bacon => "delicious", :all_other_foods => "not so delicious"}, {:hello => "world", :all_other_foods => "not so delicious"})
    test.assert_similar({:hello => "world", :all_other_foods => "not so delicious"}, {:hello => "world", :bacon => "delicious", :all_other_foods => "not so delicious"})
    test.assert_similar({
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ], "and" => "another"
                }
              }
            }
          }
        }
      }
    }, {
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ]
                }
              }
            }
          }
        }
      }
    })
  end
  test.it "should have a working \"assert_not_similar\" method" do
    # Passing Tests
    test.assert_not_similar [], [[[]]]
    test.assert_not_similar [[[]]], []
    test.assert_not_similar({:hello => "world", :bacon => "delicious", :all_other_foods => "not so delicious"}, {:hello => "world", :all_other_foods => "not so delicious"})
    test.assert_not_similar({:hello => "world", :all_other_foods => "not so delicious"}, {:hello => "world", :bacon => "delicious", :all_other_foods => "not so delicious"})
    test.assert_not_similar({
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ], "and" => "another"
                }
              }
            }
          }
        }
      }
    }, {
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ]
                }
              }
            }
          }
        }
      }
    })
    # Failing Tests
    test.assert_not_similar [], []
    test.assert_not_similar (1..1000).to_a, (1..1000).to_a
    test.assert_not_similar({"hello" => "world", :bacon => "is delicious"}, {"hello" => "world", :bacon => "is delicious"})
    test.assert_not_similar({:array => [2, 4, 6, 8, 10], :hash => {:hello => :world}}, {:array => [2, 4, 6, 8, 10], :hash => {:hello => :world}})
    test.assert_not_similar({
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ]
                }
              }
            }
          }
        }
      }
    }, {
      :multiple => {
        :layers => {
          :of => {
            :nested => {
              :hashes => {
                :and => {
                  :arrays => [
                    [1, 2, 3],
                    [10, 30, 20],
                    [1000, 1024, 666, [1, [2, [3, [4, [5, 6]]]]]]
                  ]
                }
              }
            }
          }
        }
      }
    })
  end
end

=begin
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
=end

=begin
test.describe "RubyTester" do
  test.it "should have a working (protected) \"check_similar\" method" do
    # Primitives
    test.expect(test.check_similar nil, nil)
    test.expect(test.check_similar true, true)
    test.expect(test.check_similar false, false)
    test.expect(test.check_similar 1, 1)
    test.expect(test.check_similar 0, 0)
    test.expect(test.check_similar Math::PI, Math::PI)
    test.expect(test.check_similar Math::E, Math::E)
    test.expect(test.check_similar "Hello World", "Hello World")
    test.expect(test.check_similar "bacon", "bacon")
    test.expect(!test.check_similar(true, false))
    test.expect(!test.check_similar(false, true))
    test.expect(!test.check_similar(1, 0))
    test.expect(!test.check_similar(0, 1))
    test.expect(!test.check_similar(Math::PI, Math::E))
    test.expect(!test.check_similar(Math::E, Math::PI))
    test.expect(!test.check_similar("Hello World", "hello world"))
    test.expect(!test.check_similar("hello world", "Hello World"))
    test.expect(!test.check_similar("Hello World", "bacon"))
    test.expect(!test.check_similar("bacon", "Hello World"))
    test.expect(!test.check_similar(true, 1))
    test.expect(!test.check_similar(1, true))
    test.expect(!test.check_similar(false, 0))
    test.expect(!test.check_similar(0, false))
    # Arrays
    test.expect(!test.check_similar([1], 1))
    test.expect(!test.check_similar(1, [1]))
    test.expect(!test.check_similar("Hello World", ['H','e','l','l','o',' ','W','o','r','l','d']))
    test.expect(!test.check_similar(['H','e','l','l','o',' ','W','o','r','l','d'], "Hello World"))
    test.expect(test.check_similar [], [])
    test.expect(test.check_similar [1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
    test.expect(test.check_similar ["Hello", "World", "bacon", "is", "delicious"], ["Hello", "World", "bacon", "is", "delicious"])
    test.expect(test.check_similar (1..100).to_a, (1..100).to_a)
    test.expect(test.check_similar [], [])
    test.expect(test.check_similar [[]], [[]])
    test.expect(test.check_similar [[[]]], [[[]]])
    test.expect(test.check_similar [[[[]]]], [[[[]]]])
    test.expect(test.check_similar [[[[[]]]]], [[[[[]]]]])
    test.expect(test.check_similar [[["Hello", "World", "bacon", "is", "delicious"]]], [[["Hello", "World", "bacon", "is", "delicious"]]])
    test.expect(test.check_similar [[[[["Hello", "World", "bacon", "is", "delicious"]]]]], [[[[["Hello", "World", "bacon", "is", "delicious"]]]]])
    test.expect(test.check_similar [[[[[[[[[[["Hello", "World", "bacon", "is", "delicious"]]]]]]]]]]], [[[[[[[[[[["Hello", "World", "bacon", "is", "delicious"]]]]]]]]]]])
    test.expect(test.check_similar [[1, 0, 0], [0, 1, 0], [0, 0, 1]], [[1, 0, 0], [0, 1, 0], [0, 0, 1]])
    test.expect(test.check_similar [[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    test.expect(test.check_similar [1, [2, [3, [4, [5]]]]], [1, [2, [3, [4, [5]]]]])
    test.expect(test.check_similar [1, [2, [3, [4, [5], 6], 7], 8], 9], [1, [2, [3, [4, [5], 6], 7], 8], 9])
    test.expect(!test.check_similar([1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 6]))
    test.expect(!test.check_similar([1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5]))
    test.expect(!test.check_similar([1, 2, 3, 4, 5], [2, 4, 3, 5, 1]))
    test.expect(!test.check_similar([2, 4, 3, 5, 1], [1, 2, 3, 4, 5]))
    test.expect(!test.check_similar(["Hello", "World", "bacon", "is", "delicious"], ["Hello", "World"]))
    test.expect(!test.check_similar(["Hello", "World"], ["Hello", "World", "bacon", "is", "delicious"]))
    test.expect(!test.check_similar([], [0]))
    test.expect(!test.check_similar([0], []))
    test.expect(!test.check_similar([[[[[]]]]], [[[[[false]]]]]))
    test.expect(!test.check_similar([[[[[false]]]]], [[[[[]]]]]))
    test.expect(!test.check_similar(["Hello", "World", "bacon", "is", "delicious"], [[[[[[[["Hello", "World", "bacon", "is", "delicious"]]]]]]]]))
    test.expect(!test.check_similar([], [[]]))
    test.expect(!test.check_similar([[]], []))
    test.expect(!test.check_similar([[[[[]]]]], [[[[]]]]))
    test.expect(!test.check_similar([[[[]]]], [[[[[]]]]]))
    test.expect(!test.check_similar([[1, 0, 0], [0, 1, 0], [0, 0, 1]], [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
    test.expect(!test.check_similar([[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[1, 0, 0], [0, 1, 0], [0, 0, 1]]))
    test.expect(!test.check_similar([1, [2, [3, [4, [5]]]]], [1, [2, [3, [4]]]]))
    test.expect(!test.check_similar([1, [2, [3, [4]]]], [1, [2, [3, [4, [5]]]]]))
    test.expect(!test.check_similar([1, [2, [3, [4, [5], 6], 7], 8], 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]))
    test.expect(!test.check_similar([1, 2, 3, 4, 5, 6, 7, 8, 9], [1, [2, [3, [4, [5], 6], 7], 8], 9]))
    # Hashes
    test.expect(!test.check_similar(3, {"Hello" => 3}))
    test.expect(!test.check_similar({"Hello" => 3}, 3))
    test.expect(!test.check_similar(3, {:hello => 3}))
    test.expect(!test.check_similar({:hello => 3}, 3))
    test.expect(!test.check_similar(["Hello", "World"], {"Hello" => "World"}))
    test.expect(!test.check_similar({"Hello" => "World"}, ["Hello", "World"]))
    test.expect(!test.check_similar([:hello, "World"], {:hello => "World"}))
    test.expect(!test.check_similar({:hello => "World"}, [:hello, "World"]))
    test.expect(test.check_similar({"hello" => "world"}, {"hello" => "world"}))
    test.expect(test.check_similar({:hello => "world"}, {:hello => "world"}))
    test.expect(!test.check_similar({"hello" => "world"}, {:hello => "world"}))
    test.expect(!test.check_similar({:hello => "world"}, {"hello" => "world"}))
    test.expect(test.check_similar({:hello => :world}, {:hello => :world}))
    test.expect(!test.check_similar({:hello => "world"}, {:hello => :world}))
    test.expect(!test.check_similar({:hello => :world}, {:hello => "world"}))
    test.expect(test.check_similar({"Hello" => "World", "bacon" => "delicious"}, {"bacon" => "delicious", "Hello" => "World"}))
    test.expect(test.check_similar({}, {}))
    test.expect(test.check_similar([[{}]], [[{}]]))
    test.expect(test.check_similar({
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 3, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }, {
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 3, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }))
    test.expect(!test.check_similar({
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 3, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }, {
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }))
    test.expect(!test.check_similar({
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }, {
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 3, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }))
    test.expect(!test.check_similar({
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 3, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }, {
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100, 3]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }))
    test.expect(!test.check_similar({
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100, 3]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }, {
      "hello" => "world",
      :hello => :world,
      :bacon => ["Most", "delicious", "food", {
        :on => "the planet",
        :in => "the universe",
        "within" => :multiverse,
        "global rankings" => [100, 100, 99, 100, 3, 100, 100, 97, 100, 99, 100, 100, 100, 100, 100, 100, 100]
      }],
      "curry" => :also_delicious,
      :pizza => :very_delicious_indeed,
      "UFOs" => ["Very", ["Likely", "Unlikely"], {:impossible? => "I don't think so"}]
    }))
  end
end
=end
