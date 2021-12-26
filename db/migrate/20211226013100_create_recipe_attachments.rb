class CreateRecipeAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_attachments do |t|
      t.integer :recipe_id
      t.string :image

      t.timestamps
    end
  end
end
