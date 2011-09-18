class BuildSkill < ActiveRecord::Base
  belongs_to :build, :foreign_key => "build_id"
  belongs_to :skill, :foreign_key => "skill_id"
  belongs_to :rune, :foreign_key => "rune_id"
  has_many :rune_effects, :through => :runes
end
