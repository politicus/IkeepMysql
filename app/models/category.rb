class Category < ActiveRecord::Base
	has_friendly_id :cname, :use_slug => true, :cache_column => 'cache_slug'
	
	belongs_to :user, :foreign_key => :uid
	has_many :websites, :foreign_key => :cid
end
