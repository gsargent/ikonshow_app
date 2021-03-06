class User < ActiveRecord::Base
  has_many :exercises
  has_and_belongs_to_many :roles, :join_table => :users_roles
  rolify
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, 
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, 
  				  :remember_me, :login,
            :role_ids

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Override Devise's find_for_database_authentication method
  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions).where(["lower(username) = :value OR lower(email) = :value",
  			{ :value => login.downcase }]).first
  	else
  		where(conditions).first
  	end
  end

  def role?(role)
    roles.include? role.to_s
  end
end
