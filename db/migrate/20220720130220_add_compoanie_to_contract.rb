class AddCompoanieToContract < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :company, foreign_key: true, index:true
  end
end
