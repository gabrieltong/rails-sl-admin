class Group < ActiveRecord::Base
	belongs_to :client
	has_many :group_members
	has_many :members, :primary_key=>:phone, :foreign_key=>:phone
	
	validates :title, :position, :desc, :active, :presence=>true

	def self.permit_params
		[:client_id,:title,:position,:desc,:active,:default]
	end	
end
