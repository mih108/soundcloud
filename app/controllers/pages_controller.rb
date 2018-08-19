class PagesController < ApplicationController
    
    def home
        @musics = Music.all
    end
    
    def profile
        @user = User.find(params[:id])
        
        @musics = Music.where("user_id = ?", @user.id)
    end

end
