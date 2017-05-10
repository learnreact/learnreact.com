class AddSlugIndexToCourses < ActiveRecord::Migration[5.1]
  def change
    add_index :courses, :slug
  end
end
