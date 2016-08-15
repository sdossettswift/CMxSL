class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :sector
      t.string :description
      t.string :status
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.timestamps
    end
  end
end
