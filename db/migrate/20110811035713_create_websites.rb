class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.string :title
      t.string :url
      t.string :msg
      t.integer :cid
      t.integer :uid
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :websites
  end
end
