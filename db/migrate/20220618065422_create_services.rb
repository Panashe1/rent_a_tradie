class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :category
      t.string :description
      t.string :cost
      t.float :average_rating
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
