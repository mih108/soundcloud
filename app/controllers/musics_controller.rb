class MusicsController < ApplicationController

    def show
        @music = Music.find(params[:id]) 
        
        @user = User.find(@music.user_id)
    end

    def new
       @music = current_user.musics.build
    end

    def create
        @music = current_user.musics.build(music_params)
        
        if @music.save
          flash[:notice] = "Successfully created post!"
          redirect_to music_path(@music)
        else
          flash[:alert] = "Error creating new post!"
          render :new
        end
    end
    
    def edit
      @music = Music.find(params[:id])
    end
    
    def update
      @music = Music.find(params[:id])
      
      if @music.update(music_params)
        redirect_to music_path(@music.id)
      else
        render "edit"
      end
      
    end
    
    def destroy
      @music = Music.find(params[:id])
      @user = User.find( @music.user_id)
      
      @music.destroy
      
      redirect_to profile_path(@user)
    end


private

  def music_params
    params.require(:music).permit(:title, :description, :file)
  end
end
