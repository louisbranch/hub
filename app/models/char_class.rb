class CharClass < ActiveRecord::Base
  has_many :skills, :dependent => :destroy
end
