class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  validates :name,  :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :length => 3..20
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :builds, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  accepts_nested_attributes_for :builds
  
  def has_voted?(build)
    like = Like.where("user_id = ? AND build_id = ?", self, build).first
  end
  
end
