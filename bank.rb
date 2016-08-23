module Bank
	class Account
		attr_reader :balance

		def initialize(balance=0)
			@acct_num = rand(111111111..999999999)
			@balance = balance
			unless @balance >= 0
				raise ArgumentError.new("You can't have an initial negative balance.")
			end
			@owner = add_owner
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

	class Owner
		def initialize(owner_hash)
			@first_name = owner_hash[:first_name]
			@last_name = owner_hash[:last_name]
			@street = owner_hash[:street]
			@apt = owner_hash[:apt]
			@city = owner_hash[:city]
			@state = owner_hash[:state]
			@country = owner_hash[:country]
			@zipcode = owner_hash[:zipcode]
			@birthdate = owner_hash[:birthdate]
		end
	end
end
