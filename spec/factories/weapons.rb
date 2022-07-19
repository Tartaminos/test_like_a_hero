FactoryBot.define do
  factory :weapon do
    name { FFaker::Food.ingredient }
    description { FFaker::Lorem.paragraph }  
    powerbase { FFaker::Random.rand(1..9999) }
    powerstep { FFaker::Random.rand(1..9999) }
    level { FFaker::Random.rand(1..99) }
    currentpower { FFaker::Random.rand(1..99) }
    title { FFaker::Lorem.sentence }
  end
end
