class Skill < ActiveRecord::Base
  belongs_to :skill_type, :foreign_key => "skill_type_id"
  has_many :rune_effects
  has_many :runes, :through => :rune_effects
end
