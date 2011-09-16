class Skill < ActiveRecord::Base
  belongs_to :char_classes
  has_one :skill_types
end
