class RenameMunicipaletyToColumnDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :municipalety, :municipality
  end
end
