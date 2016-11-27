class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
    end
    
    add_index :customers, :name
    add_index :customers, :email, unique: true
  end
end
