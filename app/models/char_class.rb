class CharClass < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  has_many :skills, :foreign_key => "char_class_id"
  has_many :skill_types, :foreign_key => "char_class_id"
  has_many :builds, :foreign_key => "char_class_id"
end

