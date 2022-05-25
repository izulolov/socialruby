class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    #@user = User.new(params[:user])    # Не окончательная реализация!
    @user = User.new(user_params)
    if @user.save
      #Вход после регистрации, то есть если пользовател зарегался
      #то сразу откроется его страница
      log_in @user
      
      
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Обработать успешное сохранение.
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
