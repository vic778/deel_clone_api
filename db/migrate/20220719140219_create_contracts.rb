class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.integer :name, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :contracts, :name
  end
end
