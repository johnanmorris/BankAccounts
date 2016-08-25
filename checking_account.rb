require_relative 'bank'

class CheckingAccount < Bank::Account
	def initialize(id, balance, open_date)
		super
		@checks = 0
	end

	def withdraw(amount)
		fee = 100
		if amount <= 0
			puts "Invalid amount."
		elsif amount + fee > @balance
			puts "This withdrawal would cause you to overdraw your account."
		else
			@balance -= (amount + fee)
		end
		return @balance
	end

	def withdraw_using_check(amount)

	end

	def reset_checks
		@checks = 0
	end
end
