class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.integer :gallery_id

      t.timestamps
    end
  end
end
