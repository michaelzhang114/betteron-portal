class VideosController < ApplicationController
  def index
    if params[:post_id]
      set_video
    else
      @videos = Video.all
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @video = @post.videos.find(params[:id])
    authorize @video
  end

  private
    def video_params
      params.require(:video).permit(:heading, :link)
    end
    def set_video
      @videos = Post.find(params[:post_id]).videos
    end
end
