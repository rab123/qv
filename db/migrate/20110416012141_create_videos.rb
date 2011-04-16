class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :subject
      t.string :url
      t.text :embed_code
      t.integer :age_level
      t.integer :rating
      t.integer :finder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
