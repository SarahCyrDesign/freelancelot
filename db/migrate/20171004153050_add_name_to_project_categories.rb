class AddNameToProjectCategories < ActiveRecord::Migration
  def change
    add_column :project_categories, :name, :string
  end
end
