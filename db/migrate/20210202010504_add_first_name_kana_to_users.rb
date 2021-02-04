class AddFirstNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstnamekana, :string
  end
end
