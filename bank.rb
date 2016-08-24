module Bank
	class Account
		attr_reader :balance

		def initialize
			@id = rand(111111111..999999999)
			@balance = balance
			@open_date = open_date
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
		# Note: I got this method to work, if I input the owner_hash
		# directly, and initialize a hash in the Owner initialize. The
		# problem comes when I try to add values to the original hash
		# in the Owner class. I can change a value with, for example,
		# owner.street = "Street", but it won't update the hash. I think
		# this is because they're not directly tied? Or maybe because I
		# initialize the hash, I can't add to it again?
		# Look again at notes for Classes and Hashes together. How is this
		# used??
#		def add_owner(incoming_hash)
#			@owner = incoming_hash
#		end
	end

#	class Owner
#		attr_accessor :owner_hash, :first_name, :last_name, :street, :apt, :city, :state, :country, :zipcode, :birthdate
#
#		def initialize(owner_hash)
#			@first_name = owner_hash[:first_name]
#			@last_name = owner_hash[:last_name]
#			@street = owner_hash[:street]
#			@apt = owner_hash[:apt]
#			@city = owner_hash[:city]
#			@state = owner_hash[:state]
#			@country = owner_hash[:country]
#			@zipcode = owner_hash[:zipcode]
#			@birthdate = owner_hash[:birthdate]
#		end
#	end
end
