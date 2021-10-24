class AddReferenceIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ref_id, :integer
    add_index :recipes, :ref_id, unique: true
  end
  
end
