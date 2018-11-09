require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

#	def setup
#		@user = users(:michael)
#	end
#
#	test "unsuccessful edit" do
#		# beforeフィルターに引っかからないようにとりあえずログイン
#		log_in_as(@user)
#		# 編集ページにアクセス
#		get edit_user_path(@user)
#		# editビューが描画されるかチェック
#		assert_template 'users/edit'
#		# 無効な情報を送信
#		patch user_path(@user), params: { user: { name: "",
#												  email: "foo@invalid",
#												  password: "foo",
#												  password_confirmation: "bar" } }
#		# editビューが再描画されるかチェック
#		assert_template 'users/edit'
#		# エラーメッセージの個数チェック
#		assert_select "div.alert", "The form contains 4 errors."
#	end
#
#	test "successful edit" do
#		log_in_as(@user)
#		# アクセス
#		get edit_user_path(@user)
#		# ビュー描画チェック
#		assert_template 'users/edit'
#		# 有効な情報を送信
#		name	= "Foo Bar"
#		email = "foo@bar.com"
#		patch user_path(@user), params: { user: { name: name,
#												  email: email,
#												  password: "",
#												  password_confirmation: "" } }
#		# フラッシュメッセージ確認
#		assert_not flash.empty?
#		# ユーザーページへのリダイレクトを確認
#		assert_redirected_to @user
#		# データベースから最新のユーザー情報を読み込み直す
#		@user.reload
#		# データベースが更新されたことを確認
#		assert_equal name,	@user.name
#		assert_equal email, @user.email
#	end
#
#	test "successful edit with friendly forwarding" do
#		# ログインしてない状態で編集ページを開こうとする(開けないはず)
#		get edit_user_path(@user)
#		assert_equal session[:forwarding_url], edit_user_url(@user)
#		# ログインする
#		log_in_as(@user)
#		assert_nil session[:forwarding_url]
#		# フレンドリーフォワーディングにより編集ページに飛んだことを確認
#		assert_redirected_to edit_user_url(@user)
#		name = "Foo Bar"
#		email = "foo@bar.com"
#		patch user_path(@user), params: { user: { name: name,
#												  email: email,
#												  password: "",
#												  password_confirmation: "" } }
#		assert_not flash.empty?
#		assert_redirected_to @user
#		@user.reload
#		assert_equal name, @user.name
#		assert_equal email, @user.email
#	end

end
