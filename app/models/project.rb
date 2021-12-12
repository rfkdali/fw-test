class Project < ApplicationRecord
  has_many :floorplans

  validates :name, presence: true
end
