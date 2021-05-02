class Artist < ApplicationRecord
    # validates :id_custom, uniqueness: true
    validates :name, presence: true
    validates :age, presence: true

end
