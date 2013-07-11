class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :description
      t.string :statement
      t.string :cell
      t.string :lysis_buffer
      t.float :gel
      t.string :membrane
      t.string :transfer
      t.string :blocking_buffer
      t.string :primary_description
      t.string :secondary_description
      t.string :washes
      t.string :detection

      t.timestamps
    end
  end
end
