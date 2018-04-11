class Dish < ApplicationRecord
  # Direct associations

  belongs_to :favorite

  belongs_to :cuisine

  # Indirect associations

  # Validations

end
