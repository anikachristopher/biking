class User < ActiveRecord::Base 
    has_many :events
    has_secure_password 

    validates :email, :password, :username, presence: true 
    validates :email, uniqueness: true 
end

