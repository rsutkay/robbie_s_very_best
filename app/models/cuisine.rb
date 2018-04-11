class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  # Indirect associations

  has_many   :favorites,
             :through => :dishes,
             :source => :favorite

  # Validations

end
