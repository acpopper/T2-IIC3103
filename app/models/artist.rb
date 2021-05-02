class Artist < ApplicationRecord
    self.primary_key = 'id_custom'
    has_many :albums, dependent: :destroy
    # validates :id_custom, uniqueness: true
    validates :name, presence: true
    validates :age, presence: true

end
