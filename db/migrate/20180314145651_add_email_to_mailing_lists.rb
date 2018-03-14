class AddEmailToMailingLists < ActiveRecord::Migration[5.1]
  def change
    remove_index :mailing_lists, :name
    add_column   :mailing_lists, :email, :string
    add_index    :mailing_lists, :email, unique: true
  end
end
