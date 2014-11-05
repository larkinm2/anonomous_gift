class NonprofitsController < ApplicationController
  before_action :load_user, only: [:index, :create, :destroy, :update,]
  before_action :load_nonprofit, only: [:show, :edit]

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @nonprofit = Nonprofit.new
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    if @user.user_type == "individual"
      render :individual_form
    elsif @user.user_type == "company"
      render :company_form
    else
      redirect_to root_path
    end
  end

  def show
    if @nonprofit.user.user_type == "company"
      render :company_nonprofit
    elsif @nonprofit.user.user_type == "individual"
      render :individual_nonprofit
    else
      redirect_to root_path
    end
  end

  def all_nonprofits
    @nonprofits = Nonprofit.all
    render :all_nonprofit
  end

  def edit
    if @nonprofit.user.email == session[:user_email] || session[:user_role] == "admin"
      if @nonprofit.user.user_type == "individual"
      render :edit_individual
      else
      render :edit_company
      end
    else
      redirect_to root_path
    end
  end

  def update
    nonprofit = Nonprofit.find(params[:id])
    nonprofit.update(nonprofit_params)
    redirect_to nonprofit_path(nonprofit)
  end

  def destroy
    nonprofit = Nonprofit.find(params[:id])
    user = nonprofit.user_id
    nonprofit.destroy
    redirect_to user_path(user)
  end

  def create
    user = User.find(session[:user_id])
    nonprofit = Nonprofit.create(nonprofit_params)
    nonprofit.user = user
    nonprofit.save
    redirect_to user_path(user)
  end

  def load_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end

  def authorized?
    current_user_email = @nonprofit.user.email
    sessions_email = session[:user_email]
    current_user_email == sessions_email
  end

  def admin?
    session[:user_role] == "admin"
  end

  helper_method :authorized?
  helper_method :admin?

  private

  def nonprofit_params
    params.require(:nonprofit).permit(:address, :description, :business_name)
  end


  def load_user
    @user = User.find(session[:user_id])
  end

  def load_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end



end

