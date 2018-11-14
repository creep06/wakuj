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
				statement: "自然数$n$が与えられます。\"Hello\"と$n$回出力してください。各Helloの直後には改行を入れてください。",
				constraint: "$1 \\leq n \\leq 10$",
				sample1i: "1",
				sample1o: "Hello\n",
				sample2i: "3",
				sample2o: "Hello\nHello\nHello\n")

Problem.create!(name: "Sum Of The Natural Numbers",
				point: 100,
				time_limit: 1000,
				memory_limit: 8,
				testcases_count: 10,
				statement: "自然数$n$が与えられます。1から$n$までの自然数の総和を求めてください。",
				constraint: "$1 \\leq n \\leq 10^9$",
				sample1i: "2",
				sample1o: "3",
				sample2i: "10",
				sample2o: "55")

#99.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
#end
