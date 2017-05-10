class AddSlugIndexToLessons < ActiveRecord::Migration[5.1]
  def change
    add_index :lessons, :slug
  end
end
