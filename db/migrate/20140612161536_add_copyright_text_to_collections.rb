class AddCopyrightTextToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :copyrightText, :string
  end
end
