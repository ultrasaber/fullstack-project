class AddNameToProvinces < ActiveRecord::Migration[5.1]
  def change
    add_column :provinces, :name, :string
    add_column :provinces, :code, :string
  end
end
