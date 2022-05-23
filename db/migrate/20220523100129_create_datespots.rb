class CreateDatespots < ActiveRecord::Migration[5.1]
  def change
    create_table :datespots do |t|
      t.integer :prefecture_code

      t.timestamps
    end
  end
end
