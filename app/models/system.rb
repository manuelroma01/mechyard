# Sistema emplazado en una localización de un BattleMech

class System < ActiveRecord::Base
  belongs_to :battle_mech
  # belongs_to :system_type
  # belongs_to :location
end
