class Album < ApplicationRecord
  self.primary_key = 'id_custom'
  has_many :tracks, dependent: :destroy
  belongs_to :artist
end
