require_relative 'bank'

class CheckingAccount < Bank::Account
	def initialize(id, balance, open_date)
		super
		@checks = 0
	end

	def withdraw(amount)
		amount += 100
		super(amount)
	end

	def withdraw_using_check(amount)
		fee = 200
		if amount <= 0
			puts "Invalid amount."
		elsif @balance <= -1000 || @balance - amount < -1000 || @balance - amount - fee < -1000
			puts "Sorry, you can't write that check."
		else
			@checks += 1
			@balance -= amount
			if @checks > 3
				@balance -= fee
			end
		end
		return @balance
	end

	def reset_checks
		puts "Checks reset!"
		@checks = 0
	end
end
