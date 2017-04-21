class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :github
      t.string :name
      t.string :email
      t.string :avatar_url

      t.timestamps
    end
  end
end
