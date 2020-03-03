class User < ActiveRecord::Base 
    has_secure_password 
    has_many :events

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
    

end

