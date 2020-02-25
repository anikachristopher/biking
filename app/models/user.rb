class User < ActiveRecord::Base 
    has_many :events
    has_secure_password 

    validates :email, :password, :user_name, presence: true 
    validates :email, uniqueness: true 
end

