class CreateAntibodies < ActiveRecord::Migration
  def change
    create_table :antibodies do |t|
      t.string :target,  null: false
      t.string :vendor,  null: false
      t.string :product, null: false

      t.timestamps
    end
  end
end
