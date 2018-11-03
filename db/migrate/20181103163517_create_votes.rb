class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :config, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :votes, [:user_id, :config_id], unique: :true
  end
end
