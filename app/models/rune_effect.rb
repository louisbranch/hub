class RuneEffect < ActiveRecord::Base
  belongs_to :skill, :foreign_key => "skill_id"
  belongs_to :rune, :foreign_key => "rune_id"
end
