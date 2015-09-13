class TripsController < ApplicationController
   before_action :set_trip, only: [:edit, :update, :show, :like]
   before_action :require_user, except: [:show, :index]
   before_action :require_same_user, only: [:edit]
   
   def index
      @trips = Trip.paginate(page: params[:page], per_page: 4)
       # Sorting the posts by amount of likes
       #@trips = Trip.all.sort_by{|likes| likes.thumbs_up_total}.reverse #From most to least (.reverse) 
   end
    
   def show
      
   end
   
   def new
      @trip = Trip.new
   end
   
   def create
      @trip = Trip.new(trip_params) #STRONG PARAMS RAILS 4 - Explicitly List the params which can be accepted
      @trip.traveller = current_user #here<-Causing same user
      
      if @trip.save
         #do something
         flash[:success] = "You Shared your trip successfully!"
         redirect_to trips_path
      else
         render :new
      end
   end
   
   
   def edit
   end
   
   
   
   def update
      if @trip.update(trip_params)
         
         flash[:success] = "Your Trippic was updated successfully!"
         redirect_to trip_path(@trip)
      else
         render :edit
      end
   end
   
   def like
      like = Like.create(like: params[:like], traveller: current_user, trip: @trip)
      
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
      
      def set_trip
        @trip = Trip.find(params[:id]) 
      end
      
      def require_same_user
         if current_user != @trip.traveller
            flash[:danger] = "You can only edit your own trips"
            redirect_to trips_path
         end
      end
end