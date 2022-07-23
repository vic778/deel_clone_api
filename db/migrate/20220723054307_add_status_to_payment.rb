class AddStatusToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :status, :integer, default: 0, null: false
  end
end
