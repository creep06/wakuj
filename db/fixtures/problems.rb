Problem.seed(:id) do |p|
	p.id = 1
	p.name = "Hello Hello"
	p.point = 100
	p.time_limit = 1000
	p.memory_limit = 8
	p.testcases_count = 4
	p.statement = '自然数$n$が与えられます。"Hello"と$n$回出力してください。各Helloの直後には改行を入れてください。'
	p.constraint = '$1 \leq n \leq 10$'
	p.input_desc = '自然数$n$が与えられます。'
	p.output_desc = '"Hello"と$n$回出力してください。'
	p.sample1i = '1'
	p.sample1o = "Hello\n"
	p.sample2i = '3'
	p.sample2o = "Hello\nHello\nHello\n"
end

Problem.seed(:id) do |p|
	p.id = 2
	p.name = 'Sum Of The Natural Numbers'
	p.point = 100
	p.time_limit = 1000
	p.memory_limit = 8
	p.testcases_count = 10
	p.statement = '自然数$n$が与えられます。1から$n$までの自然数の総和を求めてください。'
	p.constraint = '$1 \leq n \leq 10^9$'
	p.input_desc = "自然数\$n\$が与えられます。"
	p.output_desc = '1から$n$回までの自然数の総和を出力してください。'
	p.sample1i = '2'
	p.sample1o = '3'
	p.sample2i = '10'
	p.sample2o = '55'
end
