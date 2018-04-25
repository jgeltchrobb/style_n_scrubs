class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image
      t.boolean :is_stylist

      t.timestamps
    end
  end
end
