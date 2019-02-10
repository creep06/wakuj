class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def getnames
		users = User.all
		data = []
		users.each{|u|
			data.push(u.name)
		}
		result = []
		data.sort.each{|n|
			result.push({
				'id': n,
				'text': n
			})
		}
		render json: result
	end

	def index
		@users = Kaminari.paginate_array(User.all.sort_by{|u| -u.point}).page(params[:page]).per(20)
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			# 即ログインする
			log_in @user
			# flashを表示
			flash[:success] = "ようこそ！"
			# redirect_to user_url(@user) と等価
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "更新されました"
			redirect_to @user
		else
			# 失敗したら編集ページをレンダリング
			render 'edit'
		end
	end

	def destroy
		deleted_user = User.find(params[:id])
		deleted_user_name = deleted_user.name
		deleted_user.destroy
		flash[:success] = "${deleted_user_name}を削除完了"
		redirect_to users_url
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		# beforeアクション

		# ログイン済みユーザーであるか確認
		def logged_in_user
			unless logged_in?
				store_location
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
		end

		# 正しいユーザーであるか確認
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end
