class AddNamesFilterToConfigs < ActiveRecord::Migration[5.1]
  def change
    add_column :configs, :names_filter, :string, null: false, default: ""
  end
end
