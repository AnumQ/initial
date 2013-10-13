class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, 
                  :firstname, :surname, :phone, :aimsno
  # attr_accessible :title, :body
  # attr_accessor :current_password
  # attr_accessible :current_password
#   
  
  validates_numericality_of :aimsno, :phone
  
  validates :phone, length: { minimum: 8 }
  
  validates_presence_of :email, :firstname, :surname, :aimsno
  
  
  
  
  # def update_with_password(params={}) 
    # if params[:password].blank? 
      # params.delete(:password) 
      # params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    # end 
    # update_attributes(params) 
  # end

end
