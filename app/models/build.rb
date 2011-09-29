class Build < ActiveRecord::Base
    belongs_to :char_class
    belongs_to :user
    has_many :build_skills, :dependent => :destroy
    accepts_nested_attributes_for :build_skills

    validates :name,  :presence => true
    validates :user_id,  :presence => true
    validates :char_class_id,  :presence => true
    validates_associated :build_skills
    
end

