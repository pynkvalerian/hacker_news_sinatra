class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :age, null: false
      t.string :country, null: false
      t.timestamps null: false
    end
  end
end
