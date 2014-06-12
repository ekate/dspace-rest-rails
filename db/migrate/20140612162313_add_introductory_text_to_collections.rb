class AddIntroductoryTextToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :introductoryText, :string
  end
end
