class User < ActiveRecord::Base
has_many :to_dos
has_many :assignments
has_many :events
has_many :goals
#has_many :role_users
#has_many :roles, :through=>:role_users
has_one :offer
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:dob,:address,:city,:state,:pincode,:phone_no,:provider_health,:medications,:allergies,:provider_mental,:treatment_history,:recovery_plan,:depression_level
end
