class CreateNonprofits < ActiveRecord::Migration
  def change
    create_table :nonprofits do |t|
      # TODO: Make user a user object.
      t.string :address
      t.string :description
      t.string :business_name

      t.timestamps
    end
  end
end
