class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :sex
      t.integer :height
      t.string :name
      t.string :avatar_image
      t.datetime :birthdate
      t.boolean :metric

      t.timestamps
    end
  end
end
