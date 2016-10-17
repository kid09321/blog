class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :type
      t.string :url

      t.timestamps null: false
    end
  end
end
