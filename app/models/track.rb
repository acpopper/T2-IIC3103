class Track < ApplicationRecord
  self.primary_key = 'id_custom'
  belongs_to :album
end
