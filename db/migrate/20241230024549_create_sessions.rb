class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.references :campaign, null: false, foreign_key: true
      t.text :summary
      t.text :plot
      t.datetime :date

      t.timestamps
    end
  end
end
