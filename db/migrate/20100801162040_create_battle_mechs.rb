class CreateBattleMechs < ActiveRecord::Migration
  def self.up
    create_table :battle_mechs do |t|
      t.integer :id, :null => false # pk
      t.string :code, :null => false, :limit => 10
      t.string :name, :null => false, :limit => 30
      t.integer :mass, :null => false

      # componentes
      t.string :chassis
      t.string :power_plant
      t.string :jump_jets
      t.string :armor
      t.string :comm_system
      t.string :tt_system

      # otros
      t.string :manufacturer
      
      # movimiento
      t.integer :cruising_speed, :default => 0 # km/h
      t.integer :maximum_speed, :default => 0  # km/h
      t.integer :jump_capacity, :default => 0  # m

      t.timestamps
    end
  end

  def self.down
    drop_table :battle_mechs
  end
end
