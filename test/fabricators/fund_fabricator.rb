Fabricator(:fund) do
  name { Faker::Name.name }
  rate_id { 100 * rand }
end
