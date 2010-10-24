# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# localizaciones:
#   C => 1, TC => 2, TD => 3, TI => 4, TC(P) => 5, TD(P) => 6, TI(P) => 7
#   BD => 9, BI => 10, PD => 11, PI => 12

bm_valkyrie = BattleMech.create(
  :code => 'VLK-QA',
  :name => 'Valkyrie',
  :mass => 30,
  :chassis => 'Corean Model 1AA',
  :power_plant => '150 Omni',
  :jump_jets => 'Norse industries 3S',
  :armor => 'Riese-470',
  :comm_system => 'Lynx-shur',
  :tt_system => 'Sync Tracker (39-42071)',
  :manufacturer => 'Corean Enterprises',
  :cruising_speed => 54,
  :maximum_speed => 86,
  :jump_capacity => 150
)
bm_valkyrie_las_med_1 = System.create(
  :battle_mech => bm_valkyrie,
  :system_type_id => 1,
  :location_id => 9
)
bm_valkyrie_amca2_1 = System.create(
  :battle_mech => bm_valkyrie,
  :system_type_id => 2,
  :location_id => 12
)
bm_valkyrie_amca2ammo_1 = System.create(
  :battle_mech => bm_valkyrie,
  :system_type_id => 3,
  :location_id => 4
)


bm_phoenix_hawk = BattleMech.create(
  :code => 'PXH-1',
  :name => 'Phoenix Hawk',
  :mass => 45,
  :chassis => 'Orguss Stinger',
  :power_plant => 'GM 270',
  :jump_jets => 'Pitban 9000',
  :armor => 'Durallex ligero',
  :comm_system => 'Tek Battlecom',
  :tt_system => 'Tek Tru-Trak',
  :manufacturer => 'Orguss Industries',
  :cruising_speed => 65,
  :maximum_speed => 97,
  :jump_capacity => 180
)

bm_warhammer = BattleMech.create(
  :code => 'WHM-6R',
  :name => 'Warhammer',
  :mass => 70,
  :chassis => 'StarCorp 100',
  :power_plant => 'VOX 280',
  :armor => 'Leviathon Plus',
  :comm_system => 'O/P 3000 COMSET',
  :tt_system => 'O/P 1500 ARB',
  :manufacturer => 'StarCorp Industries',
  :cruising_speed => 43,
  :maximum_speed => 65
)

bm_atlas = BattleMech.create(
  :code => 'AS7-D',
  :name => 'Atlas',
  :mass => 100,
  :chassis => 'Foundation Type 10X',
  :power_plant => 'Vlar 300',
  :armor => 'Durallex Heavy Special',
  :comm_system => 'Army Comm, Class 5',
  :tt_system => 'Army Comp. Type 29K',
  :manufacturer => 'Nair, Hesperus, Quentin',
  :cruising_speed => 32,
  :maximum_speed => 54
)
