class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  validates_uniqueness_of :username

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "200x200>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
