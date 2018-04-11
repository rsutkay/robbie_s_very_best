class Favorite < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  belongs_to :venue

  # Indirect associations

  # Validations

end
