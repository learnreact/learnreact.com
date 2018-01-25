class AddDurationToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :duration, :string
  end
end
