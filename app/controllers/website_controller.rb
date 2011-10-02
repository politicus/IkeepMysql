class WebsiteController < ApplicationController
  before_filter :login_required, :except => "ajax_get_title"

  def index
    @web = Website.all
  end

  def show
    #@web = Website.find(params[:id])
    #render :json => @web
  end

  def new
    @web = Website.new
  end

  def create
    params[:web][:uid] = session[:user].id
    @web = Website.new(params[:web])
    @web.save

    redirect_to windex_url #wshow_url(@web)
  end

  def edit
    @web = Website.find_by_uid_and_id(session[:user].id, params[:id])
    render :layout => false
  end

  def update
    @web = Website.find_by_uid_and_id(session[:user].id, params[:id])
    @web.update_attributes(:title => params[:title], :msg => params[:msg], :url => params[:url], :cid => params[:cid])
    render :layout => false
  end

  def destroy
    @web = Website.find_by_uid_and_id(session[:user].id, params[:wid])
    @web.destroy
    render :layout => false
  end

  def ajax_get_title
    url = params[:url]
    content = open(url).read
    content = content[/<title>(.*?)<\/title>/]
    content = content.gsub("<title>", "")
    content = content.gsub("</title>", "")
    content = content.gsub("&#8211;", "-")

    render :text => "#{content}"
  end

  def ajax_create
    @web = Website.new(:title => params[:title], :url => params[:url], :msg => params[:msg], :uid => session[:user].id, :cid => params[:cid].to_i)
    @web.save

    render :json => @web
  end

end
