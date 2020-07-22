FactoryBot.define do
  factory :measurement do
    time { '02:02' }
    date { '20/202/2020' }
    association :sport, name: 'Jogging'
  end
end
