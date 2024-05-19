class AddPhoneAndSurnameToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :phone, :string
    add_column :customers, :surname, :string
  end
end
