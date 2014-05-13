class User < ActiveRecord::Base

	  # Use built-in rails support for password protection
  	  has_secure_password

	  belongs_to :member

	  validates :username, presence: true, uniqueness: { case_sensitive: false}
	  validates :role, inclusion: { in: %w[admin member], message: "is not a recognized role in system" }
	  validates_presence_of :password, on: :create 
	  validates_presence_of :password_confirmation, on: :create 
	  validates_confirmation_of :password, message: "does not match"
	  validates_length_of :password, minimum: 2, message: "must be at least 4 characters long", allow_blank: true

	  # for use in authorizing with CanCan
	  ROLES = [['Administrator', :admin], ['Member', :member]]

	  def role?(authorized_role)
	    return false if role.nil?
	    role.downcase.to_sym == authorized_role
	  end

	  def self.authenticate(username,password)
	      find_by_username(username).try(:authenticate, password)
	  end


end
