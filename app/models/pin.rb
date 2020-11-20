class Pin < ActiveRecord::Base
  enum status: { draft: 0, published: 1, new_status: 2, rejected: 3, approved: 4, archival: 5 }

  # searchkick
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

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
