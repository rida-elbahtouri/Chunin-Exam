class ChangaTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :urls_tables, :shortenurls
  end
end
