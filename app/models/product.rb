class Product < ApplicationRecord
  translates :name, :description, :features

  validates :name_en, :code, presence: true

  belongs_to :brand
  belongs_to :supplier
  belongs_to :subcategory, optional: true
  belongs_to :category
  belongs_to :collection, optional: true
  has_many :images, as: :attachable
  has_one :home_slider_image, as: :attachable, class_name: Image.name
  has_one :first_image, class_name: Image.to_s, as: :attachable
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :images, :home_slider_image, reject_if: :all_blank,
    allow_destroy: true

  before_validation :set_categories

  def all_tags= names
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(',')
  end

  private

  def set_categories
    if subcategory.present?
      self.category_id = subcategory.category_id
    end
    self.subfamily_id = Category.find_by(id: category_id)&.subfamily_id
    self.family_id = Subfamily.find_by(id: subfamily_id)&.family_id
  end
end
