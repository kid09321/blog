class CreatePopularities < ActiveRecord::Migration
  def change
    create_table :popularities do |t|
      t.integer :popularity
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
