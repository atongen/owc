class EventsChangeDateToDatetime < ActiveRecord::Migration
  def up
    change_column :refinery_events, :start_date, :datetime
    change_column :refinery_events, :end_date, :datetime
  end

  def down
    change_column :refinery_events, :start_date, :date
    change_column :refinery_events, :end_date, :date
  end
end
