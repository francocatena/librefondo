Fabricator(:stock) do
  load_date { rand(1.year).ago }
  ric { Faker::Lorem.sentence }
  fund_id { 100 * rand }
end
