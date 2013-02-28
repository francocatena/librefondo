Fabricator(:payment) do
  date { rand(1.year).ago }
  pay_day { 30 * rand }
  amortization { 100 * rand }
  trust_fund_id { Fabricate(:trust_fund).id }
end
