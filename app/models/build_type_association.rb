class BuildTypeAssociation < ActiveRecord::Base
  belongs_to :build
  belongs_to :build_type
  
  validates :build_id,  :presence => true
  validates :build_type_id,  :presence => true
end
