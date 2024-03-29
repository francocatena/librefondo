Fabricator(:trust_fund) do
  name { Faker::Name.name }
  base { 100 * rand }
  fund_ids { Fabricate(:fund).id }
  coupon_tv { 100.0 * rand }
  coupon_tv_cap { 100.0 * rand }
  coupon_tv_floor { 100.0 * rand }
  nominal_value { 100.0 * rand }
  differential_margin { 100.0 * rand }
  broadcast_cost { 100.0 * rand }
  price { 100.0 * rand }
  rating { Faker::Lorem.sentence }
  buy_date { rand(1.year).ago }
  settlement_date { rand(1.year).ago }
  broadcast_date { rand(1.year).ago }
  expiration_date { rand(1.year).ago }
  tenancy { 100.0 * rand }
  purchase_price { 100.0 * rand }
  tcpe { 100.0 * rand }
  minimal_cost { 100.0 * rand }
  maximal_cost { 100.0 * rand }
  cut_date { rand(1.year).ago }
end
