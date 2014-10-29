class GiftsController < ApplicationController

  before_action :load_all_gifts

  def index
  end

  def individual
  end

  def business
  end

  def search
  search = params[:q]
  @gifts = Gift.where('lower(body) like ?', "%#{search}%")
  end


  def new
    @gift = Gift.new
    @user = User.find(session[:user_id])
    @user_type = @user.user_type
  end

  def show
    @gift = Gift.find(params[:id])
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
  end

  def destroy
    gift = Gift.find(params[:id])
    nonprofit = Nonprofit.find(params[:nonprofit_id])
    gift.delete
    redirect_to nonprofit_path(nonprofit)
  end

  def create
    gift = Gift.create(gift_params)
    nonprofit = nonprofit.find(params[:nonprofit_id])
    gift.nonprofit_id = params[:nonprofit_id]
    gift.save
    redirect_to nonprofit_path(nonprofit)
  end

  def edit
    @gift = Gift.find(params[:id])
    if @gift.user.email == session[:user_email] || admin?
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    nonprofit = Nonprofit.find(params[:nonprofit_id])
    gift = Gift.find(params[:id])
    gift.update(gift_params)
    redirect_to nonprofit_gift_path(nonprofit, gift)
  end

  helper_method :authorized?
  helper_method :admin?

  def authorized?
    current_user_email = @gift.user.email
    sessions_email = session[:user_email]
    current_user_email == sessions_email
  end

  def admin?
    session[:user_role] == "admin"
  end

  def load_all_gifts
    @gifts = Gift.all.reverse
  end

  private
  def gift_params
    params.require(:gift).permit(:body, :user_type)
  end






end

