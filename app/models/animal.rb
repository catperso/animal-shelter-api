class Animal < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
  validates :age, presence: true
  scope :search_species, -> (species_param) { where("lower(species) like ?", "%#{species_param.downcase}%") }
  scope :search_name, -> (name_param) { where("lower(name) like ?", "%#{name_param.downcase}%") }
end