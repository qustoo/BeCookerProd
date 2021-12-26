class Tag < ApplicationRecord
  has_many :taggings
  has_many :recipes, through: :taggings

  class << self
    def counts
      self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("name, taggings.tag_id")
    end
  end
end
