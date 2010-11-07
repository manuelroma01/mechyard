# == Schema Information
# Schema version: 20101024221321
#
# Table name: systems
#
#  id             :integer         not null, primary key
#  battle_mech_id :integer
#  system_type_id :integer
#  location_id    :integer
#  created_at     :datetime
#  updated_at     :datetime
#

# Sistema emplazado en una localización de un BattleMech

class System < ActiveRecord::Base
  belongs_to :battle_mech
  # belongs_to :system_type
  # belongs_to :location
end
