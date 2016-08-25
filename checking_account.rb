require_relative 'bank'

class CheckingAccount < Bank::Account
	def initialize(id, balance, open_date)
		super
		@checks = 0
	end

	def withdraw(amount)
		puts "Attempting to withdraw #{amount} ... "
		fee = 100
		if amount <= 0
			puts "Invalid amount."
		elsif amount + fee > @balance
			puts "This withdrawal would cause you to overdraw your account."
		else
			@balance -= amount
			@balance -= fee
			puts "Success! Balance is now #{@balance}."
		end
		return @balance
	end

	def withdraw_using_check(amount)
		puts "Current balance: #{@balance}"
		puts "You wrote a check for #{amount} ... "
		fee = 200
		if amount <= 0
			puts "Invalid amount."
		elsif @balance <= -1000 || @balance - amount < -1000 || @balance - amount - fee < -1000
			puts "Sorry, you can't write that check."
		else
			@checks += 1
			puts "You have written #{@checks} checks this month."
			@balance -= amount
			if @checks <= 3
				puts "#{@balance} - #{amount} = #{@balance - amount}"
			else
				puts "You have exceeded your free checks for the month."
				puts "#{@balance + amount} - #{amount} - #{fee} = #{@balance - fee}"
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
