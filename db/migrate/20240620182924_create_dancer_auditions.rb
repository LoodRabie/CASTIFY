class CreateDancerAuditions < ActiveRecord::Migration[7.1]
  def change
    create_table :dancer_auditions do |t|
      t.references :dancer, null: false, foreign_key: true
      t.references :audition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
