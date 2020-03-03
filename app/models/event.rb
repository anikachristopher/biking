class Event < ActiveRecord::Base
    belongs_to :user
    
        validates :location, :date, :event_name, presence: true
        validates :event_name, uniqueness: true
          
    end