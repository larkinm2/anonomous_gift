class AddTypeColumnToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :user_type, :string
  end
end


