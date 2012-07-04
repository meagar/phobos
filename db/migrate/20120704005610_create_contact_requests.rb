class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :email
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
