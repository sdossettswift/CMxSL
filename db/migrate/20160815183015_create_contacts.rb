class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :phone
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.text :notes
      t.string :status
      t.integer :interest
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
