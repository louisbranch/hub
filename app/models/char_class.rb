class CharClass < ActiveRecord::Base
  has_many :skill_types, :foreign_key => "char_class_id", :dependent => :destroy
  has_many :skills, :through => :skill_types, :foreign_key => "char_class_id"
end
