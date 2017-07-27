class RemoveTransciptFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :transcript, :text
  end
end
