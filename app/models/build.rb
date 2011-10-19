class Build < ActiveRecord::Base
    belongs_to :char_class
    belongs_to :user
    has_many :build_skills, :dependent => :destroy
    has_many :skills, :through => :build_skills
    has_many :comments, :dependent => :destroy
    has_many :likes, :dependent => :destroy
    accepts_nested_attributes_for :build_skills
    accepts_nested_attributes_for :comments

    validates :name,  :presence => true
    validates :user_id,  :presence => true
    validates :char_class_id,  :presence => true
    validates_associated :build_skills
    
    def thumbs_up
      self.likes.where("vote = ?", 1).count
    end
    
    def thumbs_down
      self.likes.where("vote = ?", 0).count
    end
    
    def thumbs_rate
      likes = self.thumbs_up
      dislikes = self.thumbs_down
      if (likes == 0) && (dislikes == 0)
        0
      else
        ((likes / (likes + dislikes).to_f)*100).round
      end
    end
    
    def popularity
      #simple score ranking
      thumbs_up - thumbs_down
    end   
end
