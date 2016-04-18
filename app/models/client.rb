class Client < ActiveRecord::Base
	attr_accessor :tags_text
	validates :title, presence: true
	# validates :reg, :presence=>true
	# validates :address, :presence=>true
	# validates :position, :presence=>true
	# validates :location_y, :presence=>true
	# validates :localtion_x, :presence=>true
	# validates :phone, :presence=>true
	# validates :area, :presence=>true
	# validates :type, :presence=>true
	# validates :service_started, :presence=>true
	# validates :service_ended_at, :presence=>true
	# validates :website, :presence=>true
	# validates :wechat_account, :presence=>true
	# validates :wechat_title, :presence=>true
	alias_attribute :service_started_at, :service_started
	alias_attribute :longitude, :location_y
	alias_attribute :latitude, :localtion_x
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

	has_attached_file :wechat_logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :wechat_logo, content_type: /\Aimage\/.*\Z/

	validates :longitude, :numericality=>{:greater_than_or_equal_to=>-180, :less_than_or_equal_to=>180}, :allow_nil=>true
	validates :latitude, :numericality=>{:greater_than_or_equal_to=>-90, :less_than_or_equal_to=>90}, :allow_nil=>true

  belongs_to :sp, :class_name=>:Client, :foreign_key=>:sp_id
  has_many :clients, :class_name=>:Client, :foreign_key=>:sp_id
  has_many :client_members
  has_many :members, :through=>:client_members
  has_many :shops
  has_many :groups
  has_many :group_members, :through=>:members
  has_many :client_managers
  has_many :managers, :through=>:client_managers

  scope :sp, ->{where(:is_sp=>true)}

  acts_as_taggable_on :tag

	def self.permit_params
		[:title,:reg,:address,:position,:location_y,:localtion_x,:phone,:area,:type,:service_started,:service_ended_at,:website,:wechat_account,:wechat_title,:logo,:wechat_logo,:tags_text, :is_sp, :sp_id ,:show_name,:show_phone,:show_sex,:show_borded_at,:show_pic,:show_address,:show_email, :longitude, :latitude]
	end

	def hqhj
		"http://hongq.net/hqhj/#{id}"
	end

	def hyzx
		"http://hongq.net/hyzx/#{id}"
	end

	def tags_text= (value)
		self.tag_list = value
	end

	def tags_text
		self.tag_list.join(',')
	end

	def service_deadline
		"#{service_started}-#{service_ended_at}"
	end

  def dayuConfig
		title = "佟洋测试"
		code = "123456"
		return {
	    'smsType'=>'normal',
	    'smsFreeSignName'=>'前站',
	    'smsParam'=>"{'code':'#{code}','product'=>'','item'=>'#{title}'}",
	    'recNum'=>13654265306,
	    'smsTemplateCode'=>'SMS_2145923'
		}
	end

	def send_smg_to_admin
			
	end
end