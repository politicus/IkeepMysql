class Website < ActiveRecord::Base
	has_friendly_id :title, :use_slug => true, :cache_column => 'cache_slug'

	belongs_to :category, :foreign_key => :cid
	belongs_to :user, :foreign_key => :uid
end
