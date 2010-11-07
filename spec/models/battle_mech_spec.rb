require 'spec_helper'

describe BattleMech do
  before(:each) do
    @attr = { :code => 'PNT-9R',
      :name => 'Panther',
      :mass => 35,
      :power_plant => 'Hermes 140'
    }
  end
  
  it "should create a new instance given valid attributes" do
    BattleMech.create!(@attr)
  end
  
  it "should require a code" do
    no_code_battle_mech = BattleMech.new(@attr.merge(:code => ""))
    no_code_battle_mech.should_not be_valid
  end
  
  it "should reject codes too long" do
    long_code = "A" * 11
    long_code_battle_mech = BattleMech.new(@attr.merge(:code => long_code))
    long_code_battle_mech.should_not be_valid
  end
  
  it "should reject duplicate codes" do
    BattleMech.create!(@attr)
    battle_mech_with_duplicate_code = BattleMech.new(@attr)
    battle_mech_with_duplicate_code.should_not be_valid
  end
  
  it "should require a name" do
    no_name_battle_mech = BattleMech.new(@attr.merge(:name => ""))
    no_name_battle_mech.should_not be_valid
  end
  
  it "should require a mass" do
    no_mass_battle_mech = BattleMech.new(@attr.merge(:mass => nil))
    no_mass_battle_mech.should_not be_valid
  end
  
  it "mass should be >=20" do
    too_little_mass_battle_mech = BattleMech.new(@attr.merge(:mass => 19))
    too_little_mass_battle_mech.should_not be_valid
  end
  
  it "mass should be <=100" do
    too_much_mass_battle_mech = BattleMech.new(@attr.merge(:mass => 101))
    too_much_mass_battle_mech.should_not be_valid
  end
end
