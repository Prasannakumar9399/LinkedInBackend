class UsersController < ApplicationController

    #this endpoints is for get all records /users
    def index
       render json: User.all
    end

    #this endpoint is to create or post user in datatable
    def create
      user =  User.new(user_params)

      # if user is saved sucessfully it will return user and ith status 201 for created
      if user.save
        render json:user,status: :created
        #if request is properly served but data is wrong it ll give ubprocessable_entity with code 422
      else
        render json: user.errors, status: :unprocessable_entity
      end  
    end

    #this metod will return data for saving in table
    private
   def user_params
    params.require(:user).permit(:full_name,:last_name,:company_name)
   end

end
