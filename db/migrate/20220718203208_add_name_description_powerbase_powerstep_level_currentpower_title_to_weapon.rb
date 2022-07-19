class AddNameDescriptionPowerbasePowerstepLevelCurrentpowerTitleToWeapon < ActiveRecord::Migration[7.0]
  def change
    add_column :weapons, :name, :string
    add_column :weapons, :description, :string
    add_column :weapons, :powerbase, :integer
    add_column :weapons, :powerstep, :integer
    add_column :weapons, :level, :integer
    add_column :weapons, :currentpower, :integer
    add_column :weapons, :title, :string
  end
end
