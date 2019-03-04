class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.string :instruction
      t.integer :category_id
      t.string :hero_image

      t.timestamps
    end
  end
end
