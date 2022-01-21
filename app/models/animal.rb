class Animal < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
  validates :age, presence: true
  scope :search_species, -> (species_parameter) { where("lower(species) like ?", "%#{species_parameter.downcase}%") }
end