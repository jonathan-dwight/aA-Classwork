class Cat < ApplicationRecord
    SET_COLORS = %w(dorado azul marron naranja)
 
    validates :color, inclusion: SET_COLORS
    validates :sex, inclusion: { in: %w(M F) }
    validates :name, :sex, :color, :birth_date, :description, presence: true

    def age
        ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
    end

end