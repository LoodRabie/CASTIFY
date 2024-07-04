class AddDancingStylesToDancers < ActiveRecord::Migration[7.1]
  def change
    add_column :dancers, :dancing_styles, :string
  end
end
