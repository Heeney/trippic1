class TripsController < ApplicationController
   
   def index
       @trips = Trip.all
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
   
   
      private
      
      def trip_params
         params.require(:trip).permit(:name, :summary, :description)
      end
   
end