class Tag < ApplicationRecord

  has_many :taggings
  has_many :pins, through: :taggings

  def self.counts
    # self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    all.each_with_object({}) { |t, memo| memo[t.name] = t.taggings.map(&:tag_id).count if t.taggings.count > 0 }.sort_by(&:last).reverse.to_h
  end
end
