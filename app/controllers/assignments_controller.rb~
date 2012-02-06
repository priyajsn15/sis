class AssignmentsController < ApplicationController
before_filter :authenticate_user!
layout 'student'
  # GET /assignments
  # GET /assignments.json
  def index
     @assignments = Assignment.all
     @assignments_json = []
     @assignments.each do |a|
      @assignments_json << {"title"  => a.title, "start"  =>a.from_date}
     end
     puts "=============================="
     puts @assignments_json .inspect

    if current_user.is_admin?
     @assignments = Assignment.all
    end
    unless current_user.is_admin?
     @assignments=Assignment.find(:all,:conditions=>['assign_to =?',current_user.id])
    end
    @assignment = Assignment.new
    @user=User.where(:is_admin => false)
  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @assignments_json }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @user=User.where(:is_admin => false)
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.assign_to = params[:users][0].to_i
    @assignment.user_id=current_user.id
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_path, :notice => 'Assignment was successfully created.' }
        format.json { render :json => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "index" }
        format.json { render :json => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])
    a = params[:users][0].to_i
    unless a==0
     @assignment.assign_to = a
    end
    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to assignments_path, :notice => 'Assignment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy


    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :ok }
    end
  end
end
