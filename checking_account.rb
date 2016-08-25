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
		# The input amount gets taken out of the account as a
		# result of a check withdrawal. Returns the updated
		# account balance.
		# Allows the account to go into overdraft up to -$10
		# but not any lower
		# The user is allowed three free check uses in one month,
		# but any subsequent use adds a $2 transaction fee
		# reset_checks: Resets the number of checks used to zero
		fee = 200
		if amount <= 0
			puts "Invalid amount."
		else
			@checks += 1
			if @checks <= 3
				@balance -= amount
				puts @checks
			else
				@balance -= (amount + fee)
				puts @checks
			end
		end
		return @balance
	end

	def reset_checks
		@checks = 0
	end
end
