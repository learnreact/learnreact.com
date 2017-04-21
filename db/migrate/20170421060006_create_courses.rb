class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.boolean :hidden
      t.string :slug

      t.timestamps
    end
  end
end
