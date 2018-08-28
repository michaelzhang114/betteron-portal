class VideosController < ApplicationController
  def index
    # if params[:post_id]
    #   set_video
    # else
    #   @videos = Video.all
    # end
    @videos = policy_scope(Video)
  end

  def show
    # @post = Post.find(video_params[:post_id])
    # @video = @post.videos.find(video_params[:id])
    set_video
    authorize @video
  end

  private
    def video_params
      params.require(:video).permit(:heading, :link)
    end
    def set_video
      @video = Post.find(params[:post_id]).videos
    end
end
