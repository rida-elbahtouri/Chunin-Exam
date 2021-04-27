class CreateUrlsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :urls_tables do |t|
      t.text :originalUrl
      t.string :shortUrl
      t.timestamps
    end
  end
end
