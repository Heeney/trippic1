class TravellersController < ApplicationController
    before_action :set_traveller, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update] #executed in order
    
    def index
        @travellers = Traveller.paginate(page: params[:page], per_page: 3)
    end
    
    def new 
        @traveller = Traveller.new # Instance variable
    end
    
    
    def create
        @traveller = Traveller.new(traveller_params)
        if @traveller.save # Give a success message - flash
            flash[:success] = "Your account has been created successfully"
            session[:traveller_id] = @traveller.id
            redirect_to trips_path
        else
            render 'new'
        end
    end
    
    
    def edit
    
    end
    
    
    def update
        if @traveller.update(traveller_params)
            flash[:success] = "Your Profile has been updated succesfully"
            redirect_to traveller_path(@traveller)
        else
            render 'edit'
        end
    end
    
    def show
        @trips = @traveller.trips.paginate(page: params[:page], per_page: 3)
    end
    
    private
    
    def traveller_params
        params.require(:traveller).permit(:travellername, :email, :password)
    end
    
    def set_traveller
        @traveller = Traveller.find(params[:id])
    end
    
    def require_same_user
        if current_user != @traveller
            flash[:danger] = "You can only edit your own profile"
            redirect_to root_path
        end
    end
end
