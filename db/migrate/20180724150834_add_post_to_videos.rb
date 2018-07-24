class AddPostToVideos < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :post, foreign_key: true
  end
end
