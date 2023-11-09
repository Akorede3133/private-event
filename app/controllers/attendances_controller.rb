class AttendancesController < ApplicationController

  def create
    @attended_event = Event.find(params[:id])
    @attendance = Attendance.new(attendee: current_user, attended_event: @attended_event)

    if @attendance.save
      redirect_to event_path(@attended_event)
    end
  end
end
