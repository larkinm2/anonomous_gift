class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :body, limit: 140
      t.references :nonprofit, index: true
      t.string :gift_type
      t.timestamps
    end
  end
end
