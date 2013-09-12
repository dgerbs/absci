class AddAntibodyIdToProtocols < ActiveRecord::Migration
  def change
    add_column :protocols, :antibody_id, :integer, null: false
  end
end
