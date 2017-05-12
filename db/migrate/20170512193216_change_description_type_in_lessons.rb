class ChangeDescriptionTypeInLessons < ActiveRecord::Migration[5.1]
  def change
    change_column :lessons, :description, :text
  end
end
