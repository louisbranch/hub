class Skill < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  belongs_to :char_class
  belongs_to :skill_type
  has_many :rune_effects
  has_many :build_skills
  has_many :runes, :through => :rune_effects
  has_many :builds, :through => :buil_skills
  
  default_scope order(:level)
  
  def passive?
    skill_type.name == "Passive"
  end
  
end
