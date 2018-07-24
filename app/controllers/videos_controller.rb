class VideosController < ApplicationController
  def index
    if params[:post_id]
      @videos = Post.find(params[:post_id]).videos
    else
      @videos = Video.all
    end
  end

  private
    def video_params
      params.require(:video).permit(:heading, :link)
    end
    def set_video
      @video = Video.find(params[:id])
    end
end
