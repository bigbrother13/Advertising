class Pin < ActiveRecord::Base
  searchkick
  acts_as_votable
  belongs_to :user
  belongs_to :category

  has_attached_file :image, styles: { medium: "600x600>", thumb: "400x400>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



  has_many :taggings, dependent: :delete_all
  has_many :tags, through: :taggings

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(', ').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
