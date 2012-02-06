class ToDosController < ApplicationController
before_filter :authenticate_user! 
layout 'student'
  def index
		@to_dos = ToDo.all
		@aaa = []
		@to_dos.each do |to_do|
			@aaa << {"title"  => to_do.title, "start"  =>to_do.start}
		end
		puts "=============================="
		puts @aaa .inspect
  if current_user.is_admin?
    @to_dos = ToDo.all
   end
   unless current_user.is_admin?
    @to_dos=ToDo.find(:all,:conditions=>['assign_to =?',current_user.id])
   end
    @to_do = ToDo.new
    @user=User.where(:is_admin => false)
        
  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @aaa  }
    end
      #~ @to_dos=ToDo.all
      #~ @to_dos = current_user.to_dos.find(:all,:order=>"start ASC")

	 #~ respond_to do |format|
	   #~ format.js
	   #~ format.json {render :json => @to_dos}
	 #~ end
	   
  end
  
  def show
    @to_do = ToDo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @to_do }
    end
  end
  
  def new
    @to_do = ToDo.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @to_do }
    end
  end
  def edit
     @user=User.where(:is_admin => false)
     @to_do = ToDo.find(params[:id])
  end
  def create
    @to_do = ToDo.new(params[:to_do])
    @to_do.assign_to = params[:users][0].to_i
#    unless params[:users].blank?
    @to_do.user_id=current_user.id
    respond_to do |format|
      if @to_do.save
        format.html { redirect_to to_dos_path, :notice => 'To do was successfully created.' }
        format.json { render :json => @to_do, :status => :created, :location => @to_do }
      else
        format.html { render :action => "index" }
        format.json { render :json => @to_do.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update
    @to_do = ToDo.find(params[:id])
    a = params[:users][0].to_i
    unless a==0
     @to_do.assign_to = a
    end
    respond_to do |format|
      if @to_do.update_attributes(params[:to_do])
        format.html { redirect_to to_dos_path, :notice => 'To do was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @to_do.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy

    respond_to do |format|
      format.html { redirect_to to_dos_url }
      format.json { head :ok }
    end
  end
  def filter
    if params[:today]==true
      @to_dos=ToDo.find(:all,:conditions=>['DATE(start)=?',Date.today])
    elsif params[:week]==true
      start_date = params[:start].blank? ? Date.today.beginning_of_month : Time.at(params[:start].to_i)
      end_date = params[:end].blank? ? Date.today.end_of_month : Time.at(params[:end].to_i)
      @to_dos = ToDo.where(:from_date => start_date..end_date).order("start ASC")
    elsif params[:month]==true
      @to_dos=ToDo.find(:all,:conditions=>['MONTH(start)=? AND YEAR(start)=?',Date.today.month, Date.today.year])
    else
      flash[:notice]="No Record found"
    end
  end
end
