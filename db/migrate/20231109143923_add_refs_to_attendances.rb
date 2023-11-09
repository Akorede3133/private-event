class AddRefsToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :attendee_id, :integer
    add_column :attendances, :attended_event_id, :integer
    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_event_id
    add_index :attendances, :attendee_id
    add_index :attendances, :attended_event_id
  end
end
