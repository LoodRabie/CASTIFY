class CreateCastings < ActiveRecord::Migration[7.1]
  def change
    create_table :castings do |t|
      t.string :title
      t.text :description
      t.string :dancing_style
      t.date :deadline
      t.string :location
      t.references :producer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
