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
end
