class CreateDancers < ActiveRecord::Migration[7.1]
  def change
    create_table :dancers do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
