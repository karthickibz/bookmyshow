class Event < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader 
	belongs_to :user
	has_one :category
	has_many :booking

	def self.search(search)
		if search
			find(:all, :conditions => [:name => search])
		else
			find(:all)
		end
	end
end
