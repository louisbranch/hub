class RuneEffect < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  belongs_to :skill
  belongs_to :rune
end

