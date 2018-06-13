class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end


  def create
  	user = User.new(user_params)
  	if user.save
  		redirect_to "/"
  	else
  		render "/users/new"
  	end
  end

  def signin
    @user = User.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users"
    else
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if(user.update(user_params))
      redirect_to "/"
    else
      render edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
      redirect_to "/"
  end





  private
	 def user_params
	  params.require(:user).permit(:name, :password)
	 end



end
