class CreateAntibodies < ActiveRecord::Migration
  def change
    create_table :antibodies do |t|
      t.string :target
      t.string :vendor
      t.string :product
      t.string :description

      t.timestamps
    end
  end
end
