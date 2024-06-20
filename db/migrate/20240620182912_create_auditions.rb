class CreateAuditions < ActiveRecord::Migration[7.1]
  def change
    create_table :auditions do |t|
      t.string :status
      t.date :date
      t.references :casting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
