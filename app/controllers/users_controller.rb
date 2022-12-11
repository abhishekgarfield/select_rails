class UsersController < ApplicationController
    def index
        @users=User.all
        @user=User.new
    end
    def show
        @user=User.find(params[:id])
        respond_to do |format|
            format.js
        end
    end
    def getinfo
        @user=User.find(params[:id])
        render json: { js: render_to_string(partial: 'users/actions') }
    end
    def edit 
        @user=User.find(params[:id])
        respond_to do |format|
            format.js
        end
    end

end
