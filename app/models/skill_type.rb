class SkillType < ActiveRecord::Base
  belongs_to :char_class, :foreign_key => "char_class_id"
  has_many :skills, :foreign_key => "skill_type_id", :dependent => :destroy
end
