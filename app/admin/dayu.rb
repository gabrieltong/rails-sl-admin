ActiveAdmin.register Dayu do
  menu :priority=>100
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  scope :all
  scope :sended
  scope :not_sended

	index do |subject|
    selectable_column
    id_column
    column :recNum
		column :smsType
		column :smsFreeSignName
		column :smsTemplateCode
		column :smsParam
    column :sended
    column :sended_at
    actions
  end

  filter :recNum
  filter :smsType
  filter :smsFreeSignName
  filter :smsTemplateCode
  filter :smsParam
  filter :sended
  filter :sended_at
end
