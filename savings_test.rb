require_relative 'savings_account'

savings = SavingsAccount.new(1234, 1000, "January 23, 2016")
# => #<SavingsAccount:0x007f8dec1c6b88 @id=1234, @balance=1000, @open_date="January 23, 2016">
savings.deposit(500)
puts "Balance: #{savings.balance}"
# => 1500
savings.withdraw(500)
# Transaction denied. This would bring you below the minimum balance for this account.
# => 1500
puts "Balance: #{savings.balance}"
savings.withdraw(40)
# => 1260
puts "Balance: #{savings.balance}"
savings.add_interest(0.25)
# => 3
puts "Balance: #{savings.balance}"
savings.balance
# => 1263
puts "Balance: #{savings.balance}"
savings.withdraw(50)
puts "Balance: #{savings.balance}"
# => 1013
savings.withdraw(50)
# Transaction denied. This would bring you below the minimum balance for this account.
# => 1013
puts "Balance: #{savings.balance}"
savings.deposit(12)
# => 1025
puts "Balance: #{savings.balance}"
