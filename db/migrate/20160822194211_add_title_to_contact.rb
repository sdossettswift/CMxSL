class AddTitleToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :title, :string
  end
end
