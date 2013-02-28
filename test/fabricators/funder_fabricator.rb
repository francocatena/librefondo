Fabricator(:funder) do
  trust_fund_id { Fabricate(:trust_fund).id }
  fund_id { Fabricate(:fund).id }
end
