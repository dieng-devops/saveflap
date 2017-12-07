class CreateMailingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :mailing_lists do |t|
      t.string  :name
      t.string  :description
      t.boolean :enabled, default: true

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
