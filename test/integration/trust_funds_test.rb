require 'test_helper'

class TrustFundsTest < ActionDispatch::IntegrationTest
  
  test 'should create new fund then a trust_fund' do
    login

    visit funds_path
    
    click_link 'Nuevo'
    
    within '.form-inputs' do
      fill_in 'Name', with: 'Fund 1'
    end

    find('[name=commit]').click

    visit trust_funds_path

    click_link 'Nuevo'

    within '.form-inputs' do
      fill_in 'Name', with: 'TrustFund 1'
      page.check('Fund 1')
      fill_in 'Base', with: 365
      fill_in 'trust_fund_coupon_tv', with: 0
      fill_in 'Coupon tv cap', with: 12
      fill_in 'Coupon tv floor', with: 0
      fill_in 'Nominal value', with: 1
      fill_in 'Differential margin', with: 3.98
      fill_in 'Broadcast cost', with: 67200000
      fill_in 'Price', with: 1
      fill_in 'Rating', with: 'Something'
      fill_in 'Tenancy', with: 18473000
      fill_in 'Buy date', with: '25/07/2012'
      fill_in 'Settlement date', with: '25/07/2012'
      fill_in 'Broadcast date', with: '13/07/2012'
      fill_in 'Expiration date', with: '22/09/2014'
      fill_in 'Cut date', with: '13/04/2012'
      fill_in 'Purchase price', with: 1.001658
      fill_in 'Tcpe', with: 17
      fill_in 'Minimal cost', with: 13
      fill_in 'Maximal cost', with: 22
      fill_in 'Number of payments', with: 2
      fill_in 'Identifier', with: 'TBV61'
    end
  
    within '#new_payment' do
      fill_in(all("[name$='[date]']")[0][:id], with: '22/04/2013')
      fill_in(all("[name$='[amortization]']")[0][:id], with: 0)
      fill_in(all("[name$='[pay_day]']")[0][:id], with: 33)
      fill_in(all("[name$='[amount]']")[0][:id], with: 0)

      fill_in(all("[name$='[date]']")[1][:id], with: '20/05/2013')
      fill_in(all("[name$='[amortization]']")[1][:id], with: 0)
      fill_in(all("[name$='[pay_day]']")[1][:id], with: 28) 
      fill_in(all("[name$='[amount]']")[1][:id], with: 0)
    end

    find('[name=commit]').click

    visit trust_funds_path
    
    find('.content a[href$=edit]').click
   
    within '#payments' do
      all('a[href$=more_info]')[1].click
      
      within '.popover' do
        tables = all('.table')

        first = tables[0]
        second = tables[1]
        third = tables[2]
        fourth = tables[3]
        fifth = tables[4]
        sixth = tables[5]

        assert_equal '100.0%', first.all('td')[0].text
        assert_equal '$0,000', first.all('td')[1].text
        assert_equal '0.0%', second.all('td')[0].text
        assert_equal '$0,000', second.all('td')[1].text
        assert_equal '$0,000', third.all('td')[0].text
        assert_equal '$18.473.000,000', third.all('td')[1].text
        assert_equal '1.30411%', fourth.all('td')[0].text
        assert_equal '$0,000', fourth.all('td')[1].text
        assert_equal '$240.906,393', fifth.all('td')[0].text
        assert_equal '$240.906,393', fifth.all('td')[1].text
        assert_equal '$65.168.663,724', sixth.all('td')[0].text
        assert_equal '$217.955,397', sixth.all('td')[1].text
      end

      assert_page_has_no_errors!
    end

  end
end
