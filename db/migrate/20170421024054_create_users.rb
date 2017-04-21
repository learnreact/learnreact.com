class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.integer :provider_id
      t.string :name
      t.string :nickname
      t.string :email
      t.string :avatar_url

      t.timestamps
    end
  end
end
