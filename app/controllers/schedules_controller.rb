class SchedulesController < ApplicationController
before_filter :authenticate_user! 
layout 'student'
require 'will_paginate/array' 
  # GET /schedules
  # GET /schedules.json
  def index
    if current_user.is_admin?
     @to_dos = ToDo.all
     @events = Event.all
     @assignments = Assignment.all
     @goals=Goal.all
     
    @to_dos= ToDo.paginate(:page => params[:page], :per_page => 3)
    @assignments= Assignment.paginate(:page => params[:page], :per_page => 3)
    @events=Event.paginate(:page => params[:page], :per_page => 3)
    @goals= Goal.paginate(:page => params[:page], :per_page => 3) 

   end
   unless current_user.is_admin?
    @to_dos=ToDo.find(:all,:conditions=>['assign_to =?',current_user.id])
    @assignments=Assignment.find(:all,:conditions=>['assign_to =?',current_user.id])
    @events=Event.find(:all,:conditions=>['assign_to =?',current_user.id])
    @goals=Goal.find(:all,:conditions=>['assign_to =?',current_user.id])
    
    @to_dos= @to_dos.paginate(:page => params[:page], :per_page => 3)
    @assignments= @assignments.paginate(:page => params[:page], :per_page => 3)
    @events=@events.paginate(:page => params[:page], :per_page => 3)
    @goals= @goals.paginate(:page => params[:page], :per_page => 3) 
 
   end
   

    @to_do = ToDo.new
    @assignment = Assignment.new
    @event = Event.new
    @goal=Goal.new
    @user =User.where(:is_admin => false)
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @schedules }
    end
  end
  
  def report
    if current_user.is_admin?
      @complete_todo = ToDo.find(:all,:conditions=>['status = ?',1])
      @pending_todo = ToDo.find(:all,:conditions=>['status = ?',0])
      @complete_assignment = Assignment.find(:all,:conditions=>['status = ?',1])
      puts @complete_assignment.count
      @pending_assignment = Assignment.find(:all,:conditions=>['status = ?',0])
      puts @pending_assignment.count
      @complete_event = Event.find(:all,:conditions=>['status = ?',1])
      @pending_event = Event.find(:all,:conditions=>['status = ?',0])
      @complete_goal = Goal.find(:all,:conditions=>['status = ?',1])
      @pending_goal = Goal.find(:all,:conditions=>['status = ?',0])
    else
      @complete_todo = ToDo.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,1])
      @pending_todo = ToDo.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,0])
      @complete_assignment = Assignment.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,1])
      @pending_assignment = Assignment.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,0])
      @complete_event = Event.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,1])
      @pending_event = Event.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,0])
      @complete_goal = Goal.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,1])
      @pending_goal = Goal.find(:all,:conditions=>['assign_to =? AND status = ?',current_user.id,0])
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
   @schedule = Schedule.find_by_id(current_user)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    #~ @schedule = Schedule.new
  @to_do = ToDo.new
  @assignment = Assignment.new
  @event = Event.new
  @goal=Goal.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(params[:schedule])
    @schedule.assign_to = params[:users][0].to_i
    @schedule.user_id=current_user.id
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to  @schedule, :notice => 'Schedule was successfully created.' }
        format.json { render :json => @schedule, :status => :created, :location => @schedule }
      else
        format.html { render :action => "new" }
        format.json { render :json => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, :notice => 'Schedule was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :ok }
    end
  end
  def mypage
   @user = User.find(current_user.id,:include=>[:offer])			
  end
end
