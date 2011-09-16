class Skill < ActiveRecord::Base
  belongs_to :skill_type, :foreign_key => "skill_type_id"
end
