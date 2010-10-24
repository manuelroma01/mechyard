class CreateSystems < ActiveRecord::Migration
  def self.up
    create_table :systems do |t|
      t.integer :id, :null => false # pk
      t.integer :battle_mech_id # fk
      t.integer :system_type_id # fk
      t.integer :location_id  # fk

      t.timestamps
    end
  end

  def self.down
    drop_table :systems
  end
end
