class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters do |t|
      t.string :email

      t.timestamps
    end

    add_index :newsletters, :email, unique: true
  end
end
