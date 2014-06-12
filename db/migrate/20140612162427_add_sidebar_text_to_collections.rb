class AddSidebarTextToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :sidebarText, :string
  end
end
