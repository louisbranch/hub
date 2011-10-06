class Build < ActiveRecord::Base
    belongs_to :char_class
    belongs_to :user
    has_many :build_skills, :dependent => :destroy
    has_many :skills, :through => :build_skills
    has_many :comments, :dependent => :destroy
    accepts_nested_attributes_for :build_skills
    accepts_nested_attributes_for :comments

    validates :name,  :presence => true
    validates :user_id,  :presence => true
    validates :char_class_id,  :presence => true
    validates_associated :build_skills
    
end

