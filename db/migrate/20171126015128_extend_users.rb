class ExtendUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name,  :string
    add_column :users, :language,   :string
    add_column :users, :time_zone,  :string

    add_column :users, :admin,   :boolean, default: false
    add_column :users, :enabled, :boolean, default: true
  end
end
