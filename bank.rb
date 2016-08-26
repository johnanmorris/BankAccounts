require 'csv'

module Bank
	class Account
		MIN_BALANCE = 0
		attr_reader :id, :balance, :open_date, :owner

		def initialize(id, balance, open_date)
			@id = id
			@balance = balance
			@open_date = open_date
			unless @balance >= self.class::MIN_BALANCE
				raise ArgumentError.new("Initial balance is too low.")
			end
		end

		def withdraw(amount)
			if amount <= 0
				puts "Invalid amount."
			else
				@balance -= amount
				if @balance < self.class::MIN_BALANCE
					puts "Transaction denied. This would bring you below the minimum balance for this account."
					@balance += amount
				end
			end
			return @balance
		end

		def deposit(amount)
			@balance += amount
			return @balance
		end

		def self.all
			# returns a collection of Account instances,
			# representing all of the Accounts described
			# in the CSV.
			accounts = []
			CSV.read("/users/johnamorris/ada/project-forks/BankAccounts/support/accounts.csv").each do |line|
				acct_id = line[0].to_i
				balance = line[1].to_i
				open_date = line[2]
				account = Account.new(acct_id, balance, open_date)
				accounts << account
			end
			return accounts
		end

		def add_owner(acct_id, acct_owner)
			a = Bank::Account.find(acct_id)
			@owner = acct_owner
			puts "#{acct_id} : #{acct_owner}"
			return @owner
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
			accounts = []

			CSV.read("/users/johnamorris/ada/project-forks/BankAccounts/support/account_owners.csv").each do |line|
				account_id = line[0].to_i
				owner_id = line[1].to_i
				account_hash[account_id] = owner_id
			end

			account_hash.each do |acct, own|
				a = self.find(acct)
				o = Owner.find(own)
				a.add_owner(acct, o)
				accounts << a
			end
			return accounts
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
				owner_id = line[0].to_i
				last_name = line[1]
				first_name = line[2]
				street = line[3]
				city = line[4]
				state = line[5]
				owner = Owner.new(owner_id, last_name, first_name, street, city, state)
				owners << owner
			end
			return owners
		end

		def self.find(id)
			#returns an instance of Owner where
			# the value of the id field in the CSV
			# matches the passed parameter
			owner_db = self.all
			owner_db.each do |acct|
				if acct.id == id
					return acct
				end
			end
		end
	end
end
