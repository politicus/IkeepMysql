class User < ActiveRecord::Base
	has_friendly_id :name, :use_slug => true, :cache_column => 'cache_slug'

	def self.checkUser(name, pass)
		user = User.find_by_name_and_pass(name, pass)
	end

	has_many :categories, :foreign_key => :uid
end
