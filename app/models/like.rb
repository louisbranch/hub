class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :build
  
  validates :user_id,  :presence => true
  validates :build_id,  :presence => true
  
  def self.vote(user, build_id, attributes = {})
    vote = user.likes.find_or_create_by_build_id(build_id)
    vote.update_attributes!(attributes)
    vote
  end
end
