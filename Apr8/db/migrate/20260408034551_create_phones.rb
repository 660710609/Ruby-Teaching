class CreatePhones < ActiveRecord::Migration[7.2]
  def change
    create_table :phones do |t|
      t.string :label
      t.string :number

      t.timestamps
    end
  end
end
