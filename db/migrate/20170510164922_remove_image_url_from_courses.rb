class RemoveImageUrlFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :image_url
  end
end
