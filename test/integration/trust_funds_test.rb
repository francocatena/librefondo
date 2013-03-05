require 'test_helper'

class TrustFundsTest < ActionDispatch::IntegrationTest
  
  test 'should create new fund then a trust_fund' do
    login

    visit funds_path
    
    click_link 'Nuevo'
    
    within '.form-inputs' do
      fill_in 'Nombre', with: 'Fondo 1'
    end

    find('[name=commit]').click

    visit trust_funds_path

    click_link 'Nuevo'

    within '.form-inputs' do
      fill_in 'Nombre', with: 'Fideicomiso 1'
      page.check('Fondo 1')
      fill_in 'Base', with: 365
      fill_in 'trust_fund_coupon_tv', with: 0
      fill_in 'Cupon TV CAP', with: 12
      fill_in 'Cupon TV FLOOR', with: 0
      fill_in 'Valor Nominal', with: 1
      fill_in 'Margen Diferencial', with: 3.98
      fill_in 'Precio de emision', with: 1000000
      fill_in 'trust_fund_price', with: 1
      fill_in 'Calificacion', with: 'Something'
      fill_in 'Tenencia', with: 0
      fill_in 'Fecha de compra', with: '25/07/2012'
      fill_in 'Fecha de liquidacion', with: '25/07/2012'
      fill_in 'Fecha de emision', with: '13/07/2012'
      fill_in 'Fecha de expiracion', with: '22/09/2014'
      fill_in 'Fecha de corte', with: '13/04/2012'
      fill_in 'Precio de compra', with: 1.001658
      fill_in 'TCPE', with: 17
      fill_in 'C. Minimo', with: 13
      fill_in 'C. Maximo', with: 22
      fill_in 'Cantidad de pagos', with: 2
      fill_in 'Identificador', with: 'TBV61'
    end
  
    within '#new_payment' do
      fill_in(all("[name$='[date]']")[0][:id], with: '22/04/2013')
      fill_in(all("[name$='[amortization]']")[0][:id], with: 500000)
      fill_in(all("[name$='[pay_day]']")[0][:id], with: 33)
      fill_in(all("[name$='[amount]']")[0][:id], with: 0)

      fill_in(all("[name$='[date]']")[1][:id], with: '20/05/2013')
      fill_in(all("[name$='[amortization]']")[1][:id], with: 500000)
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

        assert_equal '0.0%', first.all('td')[0].text
        assert_equal '$0,000', first.all('td')[1].text
        assert_equal '50.0%', second.all('td')[0].text
        assert_equal '$0,000', second.all('td')[1].text
        assert_equal '$500.000,000', third.all('td')[0].text
        assert_equal '$0,000', third.all('td')[1].text
        assert_equal '1.30411%', fourth.all('td')[0].text
        assert_equal '$0,000', fourth.all('td')[1].text
        assert_equal '$0,000', fifth.all('td')[0].text
        assert_equal '$0,000', fifth.all('td')[1].text
        assert_equal '$0,000', sixth.all('td')[0].text
        assert_equal '$0,000', sixth.all('td')[1].text
      end

      assert_page_has_no_errors!
    end

  end
end
