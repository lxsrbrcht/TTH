class ChangeSessionsDatetimeToDate < ActiveRecord::Migration[7.1]
  def change
    change_column :sessions, :date, :date
  end
end
