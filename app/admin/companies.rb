ActiveAdmin.register Company do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :legal_name, :company_type, :phone_number, :registration_number, :vat_id, :profile_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:legal_name, :company_type, :phone_number, :registration_number, :vat_id, :profile_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
