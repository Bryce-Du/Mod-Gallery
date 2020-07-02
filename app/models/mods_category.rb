class ModsCategory < ApplicationRecord
  belongs_to :mod
  belongs_to :category
end
