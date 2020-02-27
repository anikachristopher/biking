class Event < ActiveRecord::Base
    belongs_to :user
    
        validates :location, :date, presence: true
          
    end