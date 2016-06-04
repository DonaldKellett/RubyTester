class Test
  def initialize
    @passes = 0
    @fails = 0
    @errors = 0
  end
  def describe msg, &block
    80.times do
      print "#"
      sleep 0.025
    end
    puts "\e[1mRubyTester\e[22m"
    sleep 1
    puts "\e[1mv1.0.0\e[22m"
    sleep 1
    puts "\e[1mAuthored by DonaldKellett\e[22m (https://github.com/DonaldKellett)"
    sleep 1
    @passes = 0
    @fails = 0
    @errors = 0
    print "Tests will execute in 3"
    sleep 1
    print " 2"
    sleep 1
    puts " 1"
    sleep 1
    puts "-" * 80
    puts "\e[1mDescribe: #{msg}\e[22m"
    start = Time.now
    begin
      yield
    rescue Exception => e
      @errors += 1
      puts "\e[31mError: #{e}\e[0m"
    end
    dur = ((Time.now - start) * 1000).round
    puts "-" * 80
    sleep 1
    puts "\e[32m#{@passes} Passed\e[0m"
    sleep 1
    puts "\e[31m#{@fails} Failed\e[0m"
    sleep 1
    puts "\e[31m#{@errors} Errors\e[0m"
    sleep 1
    puts "Process took #{dur}ms to complete"
    sleep 1
    puts "\e[1mThank you for using RubyTester :D\e[22m"
    puts "#" * 80
  end
  def it msg, &block
    puts "\e[1mIt: #{msg}\e[22m"
    begin
      yield
    rescue Exception => e
      @errors += 1
      puts "\e[31mError: #{e}\e[0m"
    end
  end
  def expect passed, msg = "Value was not what was expected", success = "Test Passed"
    if passed
      @passes += 1
      puts "\e[32m#{success}\e[0m"
    else
      @fails += 1
      puts "\e[31m#{msg}\e[0m"
    end
  end
  def assert_equals actual, expected, msg = "Actual value did not match expected", success = "Test Passed"
    self.expect actual == expected, msg + " - Expected: " + expected.to_s + ", but instead got: " + actual.to_s, success + " - Value == " + expected.to_s
  end
  def assert_not_equals actual, unexpected, msg = "Unexpected value returned", success = "Test Passed"
    self.expect actual != unexpected, msg + " - Value was expected to not equal: " + unexpected.to_s, success + " - Value != " + unexpected.to_s
  end
  def expect_error msg, &block
    error_thrown = false
    begin
      yield
    rescue Exception => e
      error_thrown = true
      puts "Expected error thrown: #{e}"
    end
    self.expect error_thrown, msg
  end
  def expect_no_error msg, &block
    error_thrown = false
    error_msg = "Error"
    begin
      yield
    rescue Exception => e
      error_thrown = true
      error_msg = e
    end
    self.expect !error_thrown, "#{msg} - #{e}"
  end
  def random_number
    rand 101
  end
  def random_token length = 10
    token_chars = "abcdefghijklmnopqrstuvwxyz0123456789".split ""
    token = ""
    length.times do
      token += token_chars[(36 * rand).floor]
    end
    token
  end
end
