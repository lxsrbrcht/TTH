class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :synopsis
      t.string :progress
      t.string :format
      t.string :setting
      t.json :players
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
