class CreateConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :configs, id: :uuid do |t|
      t.string :title
      t.text :description
      t.text :script
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
