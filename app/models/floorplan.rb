class Floorplan < ApplicationRecord
  belongs_to :project
  has_one_attached :main_image

  validates :name, presence: true

  def original
    main_image.url
  end

  def thumb
    variant_image('100x100')
  end

  def large
    variant_image('2000x2000')
  end

  private

  def variant_image(dimensions)
    main_image.variant(resize: dimensions).processed.url
  end
end

