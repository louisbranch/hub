class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :build
  
  validates :content,  :presence => true
  validates :user_id,  :presence => true
  validates :build_id,  :presence => true
end
