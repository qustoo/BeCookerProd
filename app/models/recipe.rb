class Recipe < ApplicationRecord

  has_many :recipe_attachments
  accepts_nested_attributes_for :recipe_attachments

  has_many :taggings
  has_many :tags,through: :taggings

  # не пустые поля
  validates :title, :body, presence: true
  # для фоток
  mount_uploader :image, ImageUploader
  has_rich_text :body

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
