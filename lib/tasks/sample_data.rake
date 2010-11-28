require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    BattleMech.create!(:code => "BM-0",
      :name => "Training BattleMech",
      :mass => 20,
      :power_plant => "Pitban 120"
    )
    
    99.times do |n|
      code = "BM-#{n+1}"
      name = "Training BattleMech"
      mass = 20
      power_plant = "Pitban 120"
      BattleMech.create!(:code => code,
        :name => name,
        :mass => mass,
        :power_plant => power_plant
      )
    end
  end
end
      
    
