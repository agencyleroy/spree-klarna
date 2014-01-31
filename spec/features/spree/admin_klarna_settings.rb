require 'spec_helper'

feature 'Settings for Klarna' do
  stub_authorization!

  scenario 'update' do
    visit spree.admin_path
    click_link 'Configuration'
    click_link 'Payment Methods'
    click_link 'New Payment Method'

    select 'Spree::PaymentMethod::KlarnaInvoice', from: 'gtwy-type'
    fill_in 'payment_method_name', with: 'klarna'
    click_button 'Create'

    fill_in 'payment_method_klarna_invoice_preferred_id', with: '123456'
    fill_in 'payment_method_klarna_invoice_preferred_shared_secret', with: 'asd123asd'

    click_button 'Update'

    expect(page).to have_content 'Payment Method has been successfully updated!'

    klarna = Spree::PaymentMethod::KlarnaInvoice.first
    expect(klarna.preferred_id).to eq '123456'
    expect(klarna.preferred_shared_secret).to eq 'asd123asd'
  end
end
