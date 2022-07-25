class CreateContractDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_details do |t|
      t.string :contract_name
      t.string :contractor_residence
      t.string :job_title
      t.text :description
      t.string :start_date
      t.string :over_date
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
