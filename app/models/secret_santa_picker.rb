class SecretSantaPicker
	# 2018
	# {
	# 	"JP"=>"Marianna",
	# 	"Wladyslaw"=>"JP",
	# 	"Nell"=>"Natasha",
	# 	"Pam"=>"Franz",
	# 	"Marianna"=>"Joe",
	# 	"Scott"=>"Helena",
	# 	"Joe"=>"Pam",
	# 	"Natasha"=>"Wladyslaw",
	# 	"Franz"=>"Scott",
	# 	"Helena"=>"Nell"
	# }
	def pick!
		matches = {}
		people = [
			'JP',
			'Wladyslaw',
			'Nell',
			'JP',
			'Pam',
			'Marianna',
			'Scott',
			'Joe',
			'Natasha',
			'Franz',
			'Helena'
		]

		people.each do |person|
			matches[person] = select_secret_santa(person, people, matches)
		end

		matches
	end

	private

	def select_secret_santa(person, people, matches)
		selected_people = matches.values
		remaining_peeps = people - selected_people
		secret_santa = remaining_peeps.shuffle.first

		if secret_santa == person
			raise StandardError, "[ERROR] retrying. can't pick yourself"
		end

		secret_santa
	rescue
		p "[ERROR] retrying. can't pick yourself"
		retry
	end
end