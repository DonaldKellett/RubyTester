class Test
  attr_accessor :passes, :fails, :errors
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
    print "Parameters set - ready to execute tests in 3"
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
      puts "\e[31mError: #{e}\e[0m";
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
end
