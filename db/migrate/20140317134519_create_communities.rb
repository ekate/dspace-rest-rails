class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
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
      t.integer :countItems
      t.string :collections
      t.string :subcommunities

      t.timestamps
    end
  end
end
