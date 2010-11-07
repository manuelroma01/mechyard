# == Schema Information
# Schema version: 20101024221321
#
# Table name: battle_mechs
#
#  id             :integer         not null, primary key
#  code           :string(10)      not null
#  name           :string(30)      not null
#  mass           :integer         not null
#  chassis        :string(255)
#  power_plant    :string(255)
#  jump_jets      :string(255)
#  armor          :string(255)
#  comm_system    :string(255)
#  tt_system      :string(255)
#  manufacturer   :string(255)
#  cruising_speed :integer
#  maximum_speed  :integer
#  jump_capacity  :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class BattleMech < ActiveRecord::Base
  # relaciones
  has_many :systems
  
  # atributos
  attr_accessible :code, :name, :mass, :chassis, :power_plant, :jump_jets, :armor, :comm_system,
    :tt_system, :manufacturer

  # validaciones
  validates :code, :presence => true,
    :length => { :maximum => 10 },
    :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
  validates :mass, :presence => true,
    :numericality => { :greater_than_or_equal_to => 20, :less_than_or_equal_to => 100 }
  validates :power_plant, :presence => true
end
