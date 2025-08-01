class CreateCateogories < ActiveRecord::Migration[7.1]
  def change
    create_table :cateogories do |t|
      t.string :name

      t.timestamps
    end
  end
end
