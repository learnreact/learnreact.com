class RemoveCoverFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :cover, :text
  end
end
