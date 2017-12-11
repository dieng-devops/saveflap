class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.integer :mailing_list_id
      t.string  :email
      t.string  :first_name
      t.string  :last_name

      t.timestamps null: false
    end
  end
end
