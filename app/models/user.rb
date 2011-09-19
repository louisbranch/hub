class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  validates :name,  :presence => true,
                    :length => { :minimum => 6, :maximum => 20 }
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :builds, :foreign_key => "user_id", :dependent => :destroy
  accepts_nested_attributes_for :builds
end
