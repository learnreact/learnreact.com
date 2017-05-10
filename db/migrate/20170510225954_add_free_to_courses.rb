class AddFreeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :free, :boolean, null: false, default: false
  end
end
