class AddCodeUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :battle_mechs, :code, :unique => true
  end

  def self.down
    remove_index :battle_mechs, :code
  end
end
