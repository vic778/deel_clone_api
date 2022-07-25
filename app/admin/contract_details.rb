ActiveAdmin.register ContractDetail do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :contract_name, :contractor_residence, :job_title, :description, :start_date, :over_date, :contract_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:contract_name, :contractor_residence, :job_title, :description, :start_date, :over_date, :contract_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
