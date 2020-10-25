class Category < ApplicationRecord

  has_many :pins
  validates :name, presence: true

  has_ancestry
end
