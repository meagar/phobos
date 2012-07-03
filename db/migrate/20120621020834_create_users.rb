class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest

      t.string :display_name

      t.boolean :newsletter

      t.timestamps
    end
  end
end
