class Event < ActiveRecord::Base
    belongs_to :user
    
        validates :location, :date, :time, presence: true
          
    end