class AddWorkingTimesToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :working_times, :time
  end
end
