module ApplicationHelper

	# ページごとの完全なタイトルを返す
	def full_title(page_title = '') # メソッド定義、引数
		base_title = "わくわくジャッジ" # 変数代入
		if page_title.empty? # 論理値テスト
			base_title # 暗黙の戻り値
		else
			page_title + " | " + base_title # 文字列結合
		end
	end

	# created_atなんかを表示する時に末尾の+0900を消す
	def simple_time time
		time.strftime("%Y-%m-%d %H:%M:%S ")
	end

	# 言語名をちゃんとしたものに変換
	def language_name str
		case str
		when "c" then "C11 GCC8.2"
		when "cpp" then "C++17 GCC8.2"
		when "py" then "Python3 3.7"
		when "rb" then "Ruby 2.5"
		end
	end

	# 言語名の略称
	def language_name_s str
		case str
		when "c" then "C"
		when "cpp" then "C++"
		when "py" then "Python3"
		when "rb" then "Ruby"
		end
	end

end
