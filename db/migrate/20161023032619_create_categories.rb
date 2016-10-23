class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :article_id
      t.string :title

      t.timestamps null: false
    end
  end
end
