Fabricator(:kind) do
  name { Faker::Name.name }
  daily_acrual { 100 * rand }
  cut_date { rand(1.year).ago }
end
