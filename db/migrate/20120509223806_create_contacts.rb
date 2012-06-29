class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :phone_home
      t.string :phone_mobile
      t.string :email

      t.timestamps
    end
  end
end
