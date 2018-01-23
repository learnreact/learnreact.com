class AddTranscriptToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :transcript, :text
  end
end
