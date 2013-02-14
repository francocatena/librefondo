Fabricator(:payment) do
  date { rand(1.year).ago }
  trust_fund_id { 100 * rand }
  kind { Faker::Lorem.sentence }
end
