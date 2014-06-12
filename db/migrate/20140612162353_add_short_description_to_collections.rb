class AddShortDescriptionToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :shortDescription, :string
  end
end
