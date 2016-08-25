require_relative 'bank'
require_relative 'checking_account'

checking = CheckingAccount.new(1234, 1000, "January 23, 2016")
# <CheckingAccount:0x007fa6818aa2d0 @id=1234, @balance=1000, @open_date="January 23, 2016", @checks=0>
puts "Starting balance: #{checking.balance}"
puts " "
checking.deposit(10000)
puts " "
checking.withdraw(5000)
puts " "
checking.withdraw(5000)
puts " "
checking.withdraw(5000)
puts " "
checking.withdraw(400)
puts " "
checking.withdraw_using_check(100)
puts " "
checking.withdraw_using_check(150)
puts " "
checking.withdraw_using_check(100)
puts " "
checking.withdraw_using_check(150)
puts " "
checking.withdraw_using_check(100)
puts " "
checking.withdraw_using_check(150)
puts " "
checking.reset_checks
puts " "
checking.deposit(5000)
puts " "
checking.withdraw(400)
puts " "
checking.withdraw(600)
puts " "
checking.withdraw_using_check(100)
puts " "
checking.withdraw_using_check(100)
