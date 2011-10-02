class SessionController < ApplicationController
	before_filter :login_required, :only => :destroy


	#page login
	def new
		if session[:user].nil?
			render :layout => false
		else
			redirect_to ushow_url(session[:user].cache_slug)
		end
	end

	#post create session
	def create
		if params[:name] != "" && params[:pass] != ""
			user = User.checkUser(params[:name], Digest::MD5.hexdigest(params[:pass]))
			if user.nil?
				redirect_to root_url, :alert => "Username & Password Incorrect"
			else
				session[:user] = user
				redirect_to ushow_url(user.friendly_id)
			end
		else
			redirect_to root_url, :alert => "Please Enter Username & Password."
		end
	end

	#page logout
	def destroy
		session[:user] = nil
		redirect_to root_url, :alert => "Logout Complete."
	end

end
