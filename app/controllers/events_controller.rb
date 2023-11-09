class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event was created sucessfully!"
      redirect_to user_path(current_user)
    else
      flash.now[:error] = "Event was not created!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :location)
  end
end
