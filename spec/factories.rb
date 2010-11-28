Factory.define :battle_mech do |bm|
  bm.code 'LCT-0V'
  bm.name 'Locust'
  bm.mass 20
  bm.power_plant '160 LTV'
end

Factory.sequence :code do |n|
  "LCT-#{n}V"
end
