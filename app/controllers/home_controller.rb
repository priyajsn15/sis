class HomeController < ApplicationController
before_filter :authenticate_user! 
before_filter :check_admin
layout 'application'
  def index
    @user = User.all
    @offer= Offer.all
  end

  def create_user
    @user = User.new
    if params[:commit]=="Create" && params[:admin] == 'true' 
    @user = User.new(params[:user])
    @user.is_admin = true
    else
    @user = User.new(params[:user])
    @user.is_admin = false
    end

    respond_to do |format|
      format.html {
        if @user.save
          p params[:offer]
          @offer=Offer.new(params[:offer])
          p "11111111111111111111111111111111111111111"
          p @offer
          @offer.user_id=@user.id
          @offer.save
          flash[:notice]="User Account Created"
          redirect_to '/'
        end
      }    
    end
  
end

def task
  redirect_to :controller=>"schedules" , :action=>'index'
end

def show
  @user = User.find(current_user.id,:include=>[:offer])
end

 def edit
   @user = User.find_by_id(params[:id])
 end
 
def edit1
  @offer = Offer.find_by_user_id(params[:id])
  p @offer
end

def update1
   @offer = Offer.find_by_user_id(params[:id])
   p params[:offer]
   if @offer.update_attributes(params[:offer])
     redirect_to :action=>'index'
   else
     render :edit1
   end
end

 def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
    # @offer = Offer.find_by_user_id(params[:id])
     #@offer.update_attributes(:banner=>params[:offer])
     redirect_to :action=>'index'
   else
     render :edit
     p @user.errors
   end
 end


def check_admin
   unless current_user.is_admin?
      redirect_to :controller=>"schedules" ,  :action=>'index'
   end
end
  end
