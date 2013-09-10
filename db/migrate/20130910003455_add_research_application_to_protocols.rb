class AddResearchApplicationToProtocols < ActiveRecord::Migration
  def change
    add_column :protocols, :research_application, :string
  end
end
