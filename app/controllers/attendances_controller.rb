class AttendancesController < ApplicationController

  def create
    @attended_event = Event.find(params[:id])
    @attendee = User.find(params[:attendance][:attendee])
    @attendance = Attendance.new(attendee: @attendee, attended_event: @attended_event)

    if @attendance.save
      redirect_to event_path(@attended_event)
    end
  end

  def attendance_params
    params.require(:attendance).permit(:attendee)
  end
end
