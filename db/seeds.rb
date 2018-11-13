User.create!(name: "わくわく",
			 email: "creep040@gmail.com",
			 password: "aiueoh",
			 password_confirmation: "aiueoh",
			 admin: true)

Problem.create!(name: "Hello Hello",
				point: 100,
				time_limit: 1000,
				memory_limit: 8,
				testcases_count: 4,
				statement: "自然数nが与えられるので、Helloとn回出力してください。Helloの直後には改行を入れてください。")

#99.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
#end
