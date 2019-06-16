class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :content
      t.references :user, foreign_key: true
      t.string :author
      t.string :title

      t.timestamps
    end
  end
end
