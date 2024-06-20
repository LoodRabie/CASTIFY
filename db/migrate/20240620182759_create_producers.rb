class CreateProducers < ActiveRecord::Migration[7.1]
  def change
    create_table :producers do |t|
      t.string :name
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
