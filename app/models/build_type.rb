class BuildType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :acronym, :use => :slugged
  has_many :build_type_associations, :dependent => :destroy
  has_many :builds, :through => :build_type_associations
end
