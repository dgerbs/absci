class RemoveDescriptionFromAntibodies < ActiveRecord::Migration
  def up
    remove_column :antibodies, :description
  end

  def down
    add_column :antibodies, :description, :string
  end
end
