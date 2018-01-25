class AddIncompleteToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :incomplete, :boolean
  end
end
