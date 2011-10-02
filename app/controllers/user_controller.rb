class UserController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def index
  end

  #show user detail page after login
  def show
    if params[:id] != session[:user].cache_slug
      redirect_to ushow_url(session[:user].friendly_id)
    else
      @user = User.find_by_cache_slug(session[:user].friendly_id)
      @web = Website.find_all_by_uid(@user.id, :order => "id DESC").paginate({:per_page => 10, :page => params[:page]})
      if !params[:page].nil? #if page != nil
        render :layout => false, :template => "layouts/_web_list.html.erb"
      end
    end
  end

  def new
    @user = User.new
    render :layout => false
  end

  def create
    params[:user][:pass] = Digest::MD5.hexdigest(params[:user][:pass])
    @user = User.new(params[:user])
    @user.save

    redirect_to root_url, :notice => "Register Complete."
  end

  def edit
    @user = User.find_by_id(session[:user].id)
    render :layout => false
  end

  def update
    @user = User.find_by_id(session[:user].id)
    if params[:pass].empty?
      @user.update_attributes(:email => params["email"].to_s)
    else
      @user.update_attributes(:pass => Digest::MD5.hexdigest(params["pass"].to_s), :email => params["email"].to_s)
    end
    render :text => "Update Complete!"
  end

  def destroy
  end

end
