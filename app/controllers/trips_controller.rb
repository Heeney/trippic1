class TripsController < ApplicationController
   
   def index
      @trips = Trip.paginate(page: params[:page], per_page: 4)
       # Sorting the posts by amount of likes
       #@trips = Trip.all.sort_by{|likes| likes.thumbs_up_total}.reverse #From most to least (.reverse) 
   end
    
   def show
      @trip = Trip.find(params[:id])
   end
   
   def new
      @trip = Trip.new
   end
   
   def create
      @trip = Trip.new(trip_params) #STRONG PARAMS RAILS 4 - Explicitly List the params which can be accepted
      @trip.traveller = Traveller.find(2)
      
      if @trip.save
         #do something
         flash[:success] = "You Shared your trip successfully!"
         redirect_to trips_path
      else
         render :new
      end
   end
   
   
   def edit
      @trip = Trip.find(params[:id])
   end
   
   
   
   def update
      @trip = Trip.find(params[:id])
      if @trip.update(trip_params)
         #do something
         flash[:success] = "Your Trippic was updated successfully!"
         redirect_to trip_path(@trip)
      else
         render :edit
      end
   end
   
   def like
      @trip = Trip.find(params[:id])
      like = Like.create(like: params[:like], traveller: Traveller.first, trip: @trip)
      
      if like.valid? # Showing messsage to user that you have already voted and you new vote has not been counted
         flash[:success] = "Your selection was successful"
         redirect_to :back
      else
         flash[:danger] = "You can only like/dislike a Trippic once"
         redirect_to :back
       end
   end
   
      private
      
      def trip_params
         params.require(:trip).permit(:name, :summary, :description, :picture) #Adding Picture param
      end
   
end