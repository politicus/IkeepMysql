module Authen
	
	def login_required
		if session[:user]
			true
		else
			redirect_to root_url, :alert => "Please Login."
			false
		end
	end

	def is_admin
		if session[:user].id == 1
			true
		else
			redirect_to root_url
			false
		end
	end
end