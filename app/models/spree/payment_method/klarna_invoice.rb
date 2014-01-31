module Spree
  class PaymentMethod::KlarnaInvoice < PaymentMethod
    # Ability to activate or inactivate the service globally
    preference :active, :boolean, default: true
    preference :id, :string
    preference :shared_secret, :string
    preference :eu_zone_name, :string, default: 'EU_VAT'
    preference :terms_uri, :string, default: "#{Spree::Config[:site_url]}/terms"
    preference :checkout_uri, :string, default: "#{Spree::Config[:site_url]}/klarna/checkout"
    preference :confirmation_uri, :string, default: "#{Spree::Config[:site_url]}/klarna/confirm"
    preference :push_uri, :string, default: "#{Spree::Config[:site_url]}/klarna/callback"

    def auto_capture?
      false
    end

    def source_required?
      true
    end

    def payment_source_class
      Spree::KlarnaPayment
    end

    def payment_profiles_supported?
      true
    end

    def purchase(money, payment_source, options={})
      return payment_source.process!
    end
  end
end
