class ChangeVideoEmbedTypeInLessons < ActiveRecord::Migration[5.1]
  def change
    change_column :lessons, :video_embed, :text
  end
end
