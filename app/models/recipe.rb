class Recipe < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x400#" }, default_url: "http://via.placeholder.com/400x400"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :ingredients, inverse_of: :recipe
  has_many :directions, inverse_of: :recipe

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  validates :title, :description, presence: true

  belongs_to :user
end
