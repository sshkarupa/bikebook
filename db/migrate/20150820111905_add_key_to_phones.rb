class AddKeyToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :sms_key, :string
  end
end
