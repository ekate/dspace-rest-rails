class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :handle
      t.string :type
      t.string :link
      t.string :logo
      t.string :parentCommunity
      t.string :copyrightText
      t.string :introductoryText
      t.string :shortDescription
      t.string :sidebarText
      t.string :parentCommunityList
      t.string :items
      t.string :license
      t.integer :numberItems

      t.timestamps
    end
  end
end
