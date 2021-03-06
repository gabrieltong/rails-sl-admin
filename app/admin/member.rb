ActiveAdmin.register Member do
	menu priority: 20
	permit_params Member.permit_params	
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

	index do |subject|
		selectable_column
    id_column
    column :phone
    actions
	end

	form do |f|
		f.semantic_errors *f.object.errors.keys
		inputs I18n.t(:detail) do
			f.input :phone
	    f.input :password
	    f.input :password_confirmation
	  end
		actions		
	end

	show do
		attributes_table do
			row :phone
		end
	end

	filter :phone
end
