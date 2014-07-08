class AddNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.references :user, index:true
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
