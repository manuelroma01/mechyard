Given /^the following battle_mechs:$/ do |battle_mechs|
  BattleMech.create!(battle_mechs.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) battle_mech$/ do |pos|
  visit battle_mechs_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following battle_mechs:$/ do |expected_battle_mechs_table|
  expected_battle_mechs_table.diff!(tableish('table tr', 'td,th'))
end
