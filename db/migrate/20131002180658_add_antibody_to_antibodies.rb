class AddAntibodyToAntibodies < ActiveRecord::Migration
  def change
    add_column :antibodies, :antibody, :string, null: false
  end
end
