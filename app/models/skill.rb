class Skill < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  belongs_to :char_class, :foreign_key => "char_class_id"
  belongs_to :skill_type, :foreign_key => "skill_type_id"
  has_many :rune_effects
  has_many :runes, :through => :rune_effects
  has_many :builds, :through => :buil_skills
end
