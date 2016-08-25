require 'csv'

module Bank
	class Account
		attr_reader :id, :balance, :open_date, :owner

		def initialize(id, balance, open_date)
			@id = id
			@balance = balance
			@open_date = open_date
			unless @balance >= 0
				raise ArgumentError.new("You can't have an initial negative balance.")
			end
			@owner = add_owner(owner)
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
			#returns an instance of Account where
			# the value of the id field in the CSV
			# matches the passed parameter
			acct_db = self.all
			acct_db.each do |account|
				if account.id == id
					return account
				end
			end
		end

		def self.all_with_owners
			account_hash = {}

			CSV.read("/users/johnamorris/ada/project-forks/BankAccounts/support/account_owners.csv").each do |line|
#				puts "Account id: #{line[0]}"
#				puts "Owner id : #{line[1]}"
				account_id = line[0].to_i
				owner_id = line[1].to_i
				account_hash[account_id] = owner_id
			end

			account_hash.each do |account, owner|
				a = Account.find(account)
				a.add_owner(owner)
			end
		end

		def add_owner(owner)
			@owner = owner
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
		attr_reader :id, :last_name, :first_name, :street, :city, :state

		def initialize(id, last_name, first_name, street, city, state)
			@id = id
			@last_name = last_name
			@first_name = first_name
			@street = street
			@city = city
			@state = state
		end

		def self.all
			owners = []
			CSV.read("/users/johnamorris/ada/project-forks/BankAccounts/support/owners.csv").each do |line|
				id = line[0].to_i
				last_name = line[1]
				first_name = line[2]
				street = line[3]
				city = line[4]
				state = line[5]
				owner = Owner.new(id, last_name, first_name, street, city, state)
				owners << owner
			end
			return owners
		end

		def self.find(id)
			#returns an instance of Owner where
			# the value of the id field in the CSV
			# matches the passed parameter
			owner_db = self.all
			owner_db.each do |owner|
				if owner.id == id
					return owner
				end
			end
		end
	end
end
