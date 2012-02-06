class EventsController < ApplicationController
before_filter :authenticate_user! 
layout 'student'
  # GET /events
  # GET /events.json
  def index
   if current_user.is_admin?
    @events = Event.all
   end
   unless current_user.is_admin?
    @events=Event.find(:all,:conditions=>['assign_to =?',current_user.id])
  end
    @event = Event.new
    @user=User.where(:is_admin => false)
     @events_json = []
     @events.each do |a|
     @events_json << {"title"  => a.title, "start"  =>a.from_date}
     end
     puts "=============================="
     puts @events_json .inspect

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events_json }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @user=User.where(:is_admin => false)
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.assign_to = params[:users][0].to_i
    @event.user_id=current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "index" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    a = params[:users][0].to_i
    unless a==0
     @event.assign_to = a
    end
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
