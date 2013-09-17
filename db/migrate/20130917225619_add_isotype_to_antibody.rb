class AddIsotypeToAntibody < ActiveRecord::Migration
  def up
    add_column :antibodies, :isotype, :string, null: false
  end

  def down
  	remove_column :antibodies, :isotype, :string
  end
end
