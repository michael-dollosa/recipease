class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :slug
      t.string :img_url
      t.text :description
      t.text :instructions
      t.string :video_url

      t.timestamps
    end
  end
end
