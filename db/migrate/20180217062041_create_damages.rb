class CreateDamages < ActiveRecord::Migration[5.1]
  def change
    create_table :damages do |t|
      t.integer :hp
      t.integer :mp

      t.timestamps
    end
  end
end
