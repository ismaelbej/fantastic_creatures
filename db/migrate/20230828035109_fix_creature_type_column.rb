class FixCreatureTypeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :creatures, :type, :kind
  end
end
