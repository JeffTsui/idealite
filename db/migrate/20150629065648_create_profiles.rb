class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :profile_id
      t.string :profile_type
      t.string :nickname
      t.date :birthday
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :zipcode
      t.string :website

      t.timestamps
    end
  end
end
