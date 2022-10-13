class AddEmployeeToContract < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :employee_id, :integer, unique: true
    add_foreign_key :contracts, :users, column: :employee_id
    add_index :contracts, :employee_id
  end
end
