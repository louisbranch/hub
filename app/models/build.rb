class Build < ActiveRecord::Base
    belongs_to :char_class, :foreign_key => "char_class_id"
    belongs_to :user, :foreign_key => "user_id"
    has_many :build_skills, :foreign_key => "build_id", :dependent => :destroy
    accepts_nested_attributes_for :build_skills
end
