class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  def new
  @users = User.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    user = User.new(user_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    user.save
    # リダイレクト
    redirect_to user_path
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new #部分テンプレートで使う部分
    @books = @user.books
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
   else
    render action: :edit
   end
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
