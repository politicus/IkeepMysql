module ApplicationHelper
	def get_category_by_uid(id)
		@cate = Category.find_all_by_uid(id, :order => "id DESC")
		#@cate = session[:user].categories.all
	end

	def get_category_by_cid(id)
		@cate = Category.find_by_id(id)
		if @cate.nil?
			"Uncategorized"
		else
			@cate.cname
		end
	end

	def get_web_detail(name, id) #username & cate name
		if name.nil?
			"Total : " << Website.count(:conditions => ["uid = ?", session[:user].id]).to_s << " websites"
		elsif id == "uncategorized"
			"Total : " << Website.count(:conditions => ["uid = ? and cid = ?", session[:user].id, 0]).to_s << " websites in Uncategorized"
		else
			cate = Category.find_by_cache_slug(id)
			"Total : " << Website.count(:conditions => ["uid = ? and cid = ?", session[:user].id, cate.id]).to_s << " websites in #{cate.cname}"
		end
	end
end
