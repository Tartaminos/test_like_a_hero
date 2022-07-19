class Weapon < ApplicationRecord

    validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 99 }    

    def current_power
        (self.powerbase + ((self.level - 1) * self.powerstep))
    end

    def title
        "#{self.nome} ##{self.level}"
    end
end
