ActiveAdmin.register Client do
	permit_params Client.permit_params
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

	form do |f|
		f.semantic_errors *f.object.errors.keys
		inputs I18n.t(:detail) do
			f.input :title
			f.input :reg
			f.input :address
			f.input :location_y
			f.input :localtion_x
			f.input :area
			f.input :phone
			f.input :type
			f.input :service_started
			f.input :service_ended_at
			f.input :website
			f.input :wechat_account
			f.input :wechat_title	
		end
	end

	show do 
		attributes_table do
			row :id
			row :hqhj
			row :hyzx
			row :title
			row :reg
			row :address
			row :location_y
			row :localtion_x
			row :area
			row :phone
			row :type
			row :service_started
			row :service_ended_at
			row :website
			row :wechat_account
			row :wechat_title				
		end
	end
end
