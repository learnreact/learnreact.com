class DropChargesTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :purchases, :charge
    drop_table :charges
    add_column :purchases, :charge_token, :string
  end
end
