
class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update]

  def index
    #@videos = Video.all
    if params[:post_id]
      set_video
    else
      #@videos = Video.all
      @videos = policy_scope(Video)
    end
    #authorize(@video)
    #@videos = policy_scope(Video)
    # @user = User.find(params[:user_id])
    # video  = Video.new(user_id: @user.id)
    # authorize idea
  end

  def show
    @post = Post.find(params[:post_id])
    @video = @post.videos.find(params[:id])
    authorize(@video)
  end

  private
    def video_params
      params.require(:id).permit(:heading, :link)
    end
    def set_video
      @videos = Post.find(params[:post_id]).videos
    end

end
