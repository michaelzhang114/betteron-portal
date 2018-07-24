class Video < ApplicationRecord
  belongs_to :post, optional: true
  validates_presence_of :heading, :link, :post_id
end
