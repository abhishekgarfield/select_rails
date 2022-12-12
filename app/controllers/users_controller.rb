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
    def update
        @users=User.all
        @user=User.find(params[:id])
        if @user.update(check_params)
             respond_to do |format|
                format.js
             end
        else
            respond_to do |format|
                format.js {render :"users/edit"}
                format.json {render json:@user.errors ,status: :unprocessable_entity}
            end
        end
    end

    private
    def check_params
        params.require(:user).permit(:name,:email)
    end

end
