class GoalsController < ApplicationController
before_filter :authenticate_user! 
layout 'student'
  # GET /goals
  # GET /goals.json
  def index
   if current_user.is_admin?
    @goals = Goal.all
   end
   unless current_user.is_admin?
    @goals=Goal.find(:all,:conditions=>['assign_to =?',current_user.id])
  end
   @goals_json = []
   @goals.each do |a|
     @goals_json << {"title"  => a.title, "start"  =>a.from_date}
   end
   puts "=============================="
   puts @goals.inspect
    @goal = Goal.new
    @user=User.where(:is_admin => false)
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @goals_json }
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @user=User.where(:is_admin => false)
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(params[:goal])
    @goal.assign_to = params[:users][0].to_i
    @goal.user_id=current_user.id
    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_path, :notice => 'Goal was successfully created.' }
        format.json { render :json => @goal, :status => :created, :location => @goal }
      else
        format.html { render :action => "index" }
        format.json { render :json => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])
    a = params[:users][0].to_i
    unless a==0
     @goal.assign_to = a
    end
    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, :notice => 'Goal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :ok }
    end
  end
end
