class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :legal_name
      t.string :company_type
      t.string :phone_number
      t.integer :registration_number
      t.string :vat_id
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
