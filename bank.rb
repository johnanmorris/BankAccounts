module Bank
	class Account
		attr_reader :balance

		def initialize(balance=0)
			@acct_num = rand(111111111..999999999)
			@balance = balance
			unless @balance >= 0
				raise ArgumentError.new("You can't have an initial negative balance.")
			end
		end

		def withdraw(amount)
			if amount <= 0
				puts "Invalid amount."
			elsif amount > @balance
				puts "This withdrawal would cause you to overdraw your account. Transaction denied."
			else
				@balance -= amount
			end
			return @balance
		end

		def deposit(amount)
			@balance += amount
			return @balance
		end
	end
end
