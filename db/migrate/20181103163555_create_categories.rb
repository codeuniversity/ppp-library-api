class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
