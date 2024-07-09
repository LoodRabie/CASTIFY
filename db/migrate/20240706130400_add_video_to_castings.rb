class AddVideoToCastings < ActiveRecord::Migration[7.1]
  def change
    add_column :castings, :video, :string
  end
end
