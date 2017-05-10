class AddCoverToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :cover, :text
  end
end
