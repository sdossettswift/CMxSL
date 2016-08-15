class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :list_name
      t.string :description
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
