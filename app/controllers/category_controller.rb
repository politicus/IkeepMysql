class CategoryController < ApplicationController
  before_filter :login_required, :except => "ajax_get_title"
  
  def index
  end

  def show
    @cate = Category.find_by_cache_slug_and_uid(params[:id], session[:user].id)
    if params[:id] == "uncategorized"
      @web = Website.find_all_by_cid_and_uid(0, session[:user].id).paginate(:per_page => 10, :page => params[:page])
      #if uncategorized and page exist will return template that include only list of website
      if params[:page]
        render :layout => false, :template => "layouts/_web_list.html.erb"
      end
    elsif @cate.nil?
      #if category not exist
      redirect_to ushow_url(session[:user].cache_slug)
    else
      @web = @cate.websites.all(:order => "id DESC").paginate(:per_page => 10, :page => params[:page])
      #if category and page exist will return template that include only list of website
      if params[:page]
        render :layout => false, :template => "layouts/_web_list.html.erb"
      end
    end
  end

  def new
  end

  def create
    @cate = Category.new(:cname => params[:cname], :uid => session[:user].id)
    @cate.save
    render :json => @cate
  end

  def edit
    render :layout => false
  end

  def update
  end

  def destroy
    @cate = Category.find_by_id(params[:id])
    @web = @cate.websites.all
    @web.each do |w|
      w.update_attributes(:cid => 0)
    end
    @cate.destroy
  end

  def ajax_update
    @cate = Category.find_by_id(params[:id].to_i)
    @cate.update_attributes(:cname => params[:value])
    render :inline => "<%=link_to @cate.cname, cshow_url(session[:user].cache_slug, @cate.cache_slug)%>", :layout => false
  end

end
