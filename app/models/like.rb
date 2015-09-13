class Like < ActiveRecord::Base
   belongs_to :traveller
   belongs_to :trip
   
   validates_uniqueness_of :traveller, scope: :trip #Allowing like once to one trip / 
end