require_relative 'bank'
require_relative 'checking_account'

checking = CheckingAccount.new(1234, 1000, "January 23, 2016")
# <CheckingAccount:0x007fa6818aa2d0 @id=1234, @balance=1000, @open_date="January 23, 2016", @checks=0>

checking.deposit(5000)
# => 6000
checking.deposit(4000)
# => 10000
checking.withdraw(5000)
# => 4900
checking.withdraw(5000)
# This withdrawal would cause you to overdraw your account.
# => 4900
checking.withdraw(400)
# => 4400
checking.withdraw(400)
# => 3900
checking.withdraw(400)
# => 3400
checking.withdraw(400)
# => 2900
checking.withdraw(400)
# => 2400
checking.withdraw(400)
# => 1900
checking.withdraw(400)
# => 1400
checking.withdraw(400)
# => 900
checking.withdraw(400)
# => 400
checking.withdraw(400)
# This withdrawal would cause you to overdraw your account.
# => 400
