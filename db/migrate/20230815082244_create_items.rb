class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :first_name, null: false
    end
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
