class AddPersonToPhone < ActiveRecord::Migration[7.2]
  def change
    add_reference :phones, :person, null: false, foreign_key: true
  end
end
