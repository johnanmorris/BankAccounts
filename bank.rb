require 'csv'

module Bank
	class Account
		attr_reader :id, :balance, :open_date

		def initialize(id, balance, open_date)
			@id = id
			@balance = balance
			@open_date = open_date
			unless @balance >= 0
				raise ArgumentError.new("You can't have an initial negative balance.")
			end
		end

		def self.all
			# returns a collection of Account instances,
			# representing all of the Accounts described
			#in the CSV. See below for the CSV file specifications
			accounts = []
			CSV.read("/users/johnamorris/ada/project-forks/BankAccounts/support/accounts.csv").each do |line|
				id = line[0].to_i
				balance = line[1].to_i
				open_date = line[2]
				account = Account.new(id, balance, open_date)
				accounts << account
			end
			return accounts
		end

		def self.find(id)
			#THIS NEEDS TO USE self.all METHOD!
			#returns an instance of Account where
			# the value of the id field in the CSV
			# matches the passed parameter
			item = []
			acct_db = self.all
			acct_db.each do |account|
				if account.id == id
					item << account
				end
			end
			return item
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
