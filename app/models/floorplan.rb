class Floorplan < ApplicationRecord
  belongs_to :project
  has_one_attached :main_image

  validates :name, presence: true
end
