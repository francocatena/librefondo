Fabricator(:rate) do
  name { Faker::Name.name }
  value { 100.0 * rand }
  kind { Faker::Lorem.sentence }
end
