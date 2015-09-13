class LoginsController < ApplicationController
    
    def new
            
    end
    
    def create
        traveller = Traveller.find_by(email: params[:email])
        if traveller && traveller.authenticate(params[:password])
            session[:traveller_id] = traveller.id 
            flash[:success] = "You are logged in"
            redirect_to trips_path
        else
           flash.now[:danger] = "Your email address or password does not match" 
           render 'new'
        end
    end
    
    def destroy
        session[:traveller_id] = nil
        flash[:success] = "You have logged out"
        redirect_to trips_path
    end
       
end