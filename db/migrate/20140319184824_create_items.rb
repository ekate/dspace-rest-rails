class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :handle
      t.string :type
      t.string :link
      t.string :lastModified
      t.string :parentCollection
      t.string :parentCollectionList
      t.string :parentCommunityList
      t.string :metadata
      t.string :bitstreams
      t.boolean :archived
      t.boolean :withdrawn

      t.timestamps
    end
  end
end
