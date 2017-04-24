class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.references :charge, foreign_key: true

      t.timestamps
    end
  end
end
