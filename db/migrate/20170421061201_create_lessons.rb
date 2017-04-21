class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :course, foreign_key: true
      t.string :title
      t.string :description
      t.string :video_embed
      t.text :transcript
      t.boolean :free
      t.string :slug

      t.timestamps
    end
  end
end
