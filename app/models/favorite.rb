class Favorite < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  belongs_to :venue

  # Indirect associations

  has_many   :cuisines,
             :through => :dishes,
             :source => :cuisine

  # Validations

end
