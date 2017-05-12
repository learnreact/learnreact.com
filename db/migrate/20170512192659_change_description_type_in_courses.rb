class ChangeDescriptionTypeInCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :description, :text
  end
end
