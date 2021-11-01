class AddReferenceIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ref_id, :integer
  end
  
end
