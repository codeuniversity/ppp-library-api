class CreateConfigTags < ActiveRecord::Migration[5.1]
  def change
    create_table :config_tags, id: :uuid do |t|
      t.references :config, foreign_key: true, type: :uuid
      t.references :category, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :config_tags, [:config_id, :category_id], unique: :true
  end
end
