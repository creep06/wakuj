Problem.seed(:id) do |p|
	p.id = 1
	p.name = "Hello Hello"
	p.point = 100
	p.time_limit = 1000
	p.memory_limit = 8
	p.testcases_count = 4
	p.statement = '自然数$n$が与えられます。"Hello"と$n$回出力してください。'
	p.constraint = '$1 \leq n \leq 10$'
	p.input_desc = "\$n\$"
	p.output_desc = '"Hello"と$n$回出力してください。各"Hello"の直後には改行を入れてください。'
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
	p.input_desc = "\$n\$"
	p.output_desc = '1から$n$までの自然数の総和を出力してください。'
	p.sample1i = '2'
	p.sample1o = '3'
	p.sample2i = '10'
	p.sample2o = '55'
end

Problem.seed(:id) do |p|
	p.id = 3
	p.name = 'Minimum Absolute Sum'
	p.point = 300
	p.time_limit = 1000
	p.memory_limit = 128
	p.testcases_count = 20
	p.statement = "
		長さ\$n\$の整数列\$a\$が与えられます。整数\$x\$を自由に決められるとき、
		　\$|a_1-x| + |a_2-x| + ... + |a_n-x|\$
		の最小値を求めてください。
	"
	p.constraint = "
		\$1 \\leq n \\leq 10^5\$
		\$|a_i| \\leq 10^9 \~\~ (1 \\leq i \\leq n)$
	"
	p.input_desc = "
		\$n\$
		\$a_1\$ \$a_2\$ ... \$a_n\$
	"
	p.output_desc = "\$|a_1-x| + |a_2-x| + ... + |a_n-x|\$の最小値を出力してください。"
	p.sample1i = "
		3
		1 5 3
	"
	p.sample1o = '4'
	p.sample2i = "
		5
		2 3 5 7 11
	"
	p.sample2o = '13'
end
